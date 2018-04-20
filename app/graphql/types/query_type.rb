Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

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

  field :search do
    type types[Types::UserType]
    argument :q, !types.String
    description 'Search a user by query'
    resolve lambda { |_user, args, _ctx|
      User.where('full_name LIKE ?', "%#{args['q']}%")
    }
  end

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
