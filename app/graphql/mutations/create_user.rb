class Mutations::CreateUser < GraphQL::Function
  argument :username, !types.String
  argument :full_name, !types.String
  argument :profile_picture, types.String
  argument :bio, types.String
  argument :website, types.String
  type Types::UserType

  def call(_obj, args, _ctx)
    User.create!(
      username: args['username'],
      full_name: args['full_name'],
      profile_picture: args['profile_picture'],
      bio: args['bio'],
      website: args['website']
    )
  end
end