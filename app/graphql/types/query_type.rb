Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'
  # GET/users/self Get information about the owner of the access token.
  # GET/users/self/media/recent Get the most recent media of the user.
  # GET/users/self/media/liked Get the recent media liked by the user.
  # GET/users/self/follows Get the list of users this user follows.
  # GET/users/self/followed-by Get the list of users this user is followed by.

  # GET/users/user-id Get information about a user.
  # GET/users/user-id/media/recent Get the most recent media of a user.

  field :user do
    type Types::UserType
    argument :id, !types.ID
    description 'Find a user by id'
    resolve lambda { |_user, args, _ctx|
      User.find(args['id'])
    }
  end

  # GET/users/search Search for a user by name.
  field :search do
    type types[Types::UserType]
    argument :q, !types.String
    description 'Search a user by query'
    resolve lambda { |_user, args, _ctx|
      User.where('full_name LIKE ?', "%#{args['q']}%")
    }
  end
end
