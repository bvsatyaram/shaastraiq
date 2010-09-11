# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_iq_session',
  :secret      => '2d611d2d860fe8803ea996b9216d190b42a3fc347fb650b2132fbe9e2faf1881c2fdff66443f30743ae8399aa91e73cd420e5d98a1656535e4f1e74b978256b3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
