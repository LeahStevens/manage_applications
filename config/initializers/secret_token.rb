# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
ManageApplications::Application.config.secret_key_base = 'da51d4fee5a9d52a3265d82d6c61f2c6ff0fe603f67478e64db69ad38411ab9699e1a40283e2ac6ed2ff0a4674913cbe730306a438317185e48f26203a88155d'
#
#MyApp::Application.config.secret_token = ENV['SECRET_TOKEN']