Types::LikeType = GraphQL::ObjectType.define do
  name 'Like'

  field :id, types.ID
  field :media_id, types.ID
  field :user_id, types.ID
  field :created_at, types.String
end