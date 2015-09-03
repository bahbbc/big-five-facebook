OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 880497861999182, '1aee901be50ed025ef21d33b5e58a50f', {scope: 'user_about_me, user_posts'}
end
