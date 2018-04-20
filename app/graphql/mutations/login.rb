class Mutations::Login < GraphQL::Function
  argument :username, !types.String
  type Types::LoginType

  def call(_obj, args, _ctx)
    return unless args[:username]

    user = User.find_by(username: args[:username])
    return unless user

    OpenStruct.new({
      token: AuthToken.token(user),
      user: user
    })
  end
end