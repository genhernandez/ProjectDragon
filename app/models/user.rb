class User < ApplicationRecord
  belongs_to :team
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.oauth_token
      user.team = Team.find(1)
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :team).merge(team: Team.find(1))
  end
end
