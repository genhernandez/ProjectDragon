OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '219272524309-r16ok9pg8cpeeppj1k9t2j65pbr6757g.apps.googleusercontent.com', '18u-2QDuM3xaaehvyKzvZ2c7', {skip_jwt: true} 
  # {
    # client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}},

  # }
end
