require "jwt"
require "Dotenv"

Dotenv.load(".env")

class Auth
  APPLICATION_KEY = ENV["APPLICATION_KEY"]
  APPLICATION_ALGO = ENV["APPLICATION_ALGO"]

  def self.create_token(user_object)
    payload = { user: JSON.parse(user_object.to_json) }
    token = JWT.encode(payload, APPLICATION_KEY, APPLICATION_ALGO)
  end

  def self.decode_token(token)
    decoded_token = JWT.decode(token, APPLICATION_KEY, true, { algorithm: APPLICATION_ALGO })
  end
end
