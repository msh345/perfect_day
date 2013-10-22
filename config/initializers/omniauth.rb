OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '218294835013440', 'e47b208c4973d99469dbe9c055dc0f5a'
end
