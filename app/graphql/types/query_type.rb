Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  # GET/users/user-id Get information about a user.
  # GET/users/user-id/media/recent Get the most recent media of a user.
  # GET/users/self/media/liked Get the recent media liked by the user.
  # GET/users/self Get information about the owner of the access token.
  # GET/users/self/media/recent Get the most recent media of the user.
  # GET/users/self/follows Get the list of users this user follows.
  # GET/users/self/followed-by Get the list of users this user is followed by.
  field :user do
    type Types::UserType
    argument :id, types.ID
    description 'Find a user by id or current context'
    resolve lambda { |_user, args, ctx|
      id = if args['id'].present?
             args['id']
           else
             ctx[:current_user].id
           end

      User.find(id)
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

  # GET/media/media-id Get information about a media object.
  # GET/media/shortcode/shortcode Get information about a media object.
  field :media do
    type Types::MediaType
    argument :id, types.ID
    argument :shortcode, types.ID
    description 'Find a media by id or shortcode'
    resolve lambda { |_media, args, _ctx|
      return Media.find(args['id']) if args['id']
      return Media.find_by_shortcode(args['shortcode']) if args['shortcode']
    }
  end
end
