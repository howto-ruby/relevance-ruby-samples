# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_games_session',
  :secret      => '1e0711f74bb205bbd98e720c97f0a1a3e2899766523544aaeebad55209bccad6860c235fe1dff9a4f1eb4e89fbdb5d777a2f1650596ac98dabec083cfb555dee'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
