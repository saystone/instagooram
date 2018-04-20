class AuthToken
  def self.key
    Rails.application.secrets.secret_key_base
  end

  def self.token(user)
    JWT.encode({ user_id: user.id }, key)
  end

  def self.verify(token)
    result = JWT.decode(token, key)
    User.find_by(id: result[0]['user_id'])
  rescue JWT::InvalidIssuerError
    nil
  end
end