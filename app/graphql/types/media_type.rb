Types::MediaType = GraphQL::ObjectType.define do
  name 'Media'
  field :id, types.ID
  field :media_type, types.String
  field :images, types.String
  field :videos, types.String
  field :filter, types.String
  field :likes do
    type types[Types::UserType]
    resolve lambda { |media, _args, _ctx|
      media.liked_users
    }
  end
end
