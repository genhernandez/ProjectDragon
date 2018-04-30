class MessagesController < ApplicationController
    def new
        @message = Message.new
    end
    def create
        @message = Message.new message_params
        if @message.valid?
            MessageMailer.contact(@message).deliver_now
            redirect_to team_tasks_path(:team_id => current_team_id)
            flash[:success] = "We have received your message and will be in touch soon!"

        else
            flash[:error] = "There was an error sending your message. Please try again."
            render :new
        end
    end
private
def message_params
    # params.require(:message).permit(:name, :email, :body)
    params.permit(:message, :name, :email, :body)
  end
end
