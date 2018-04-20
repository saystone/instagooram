Types::RelationshipType = GraphQL::ObjectType.define do
  name 'Relationship'

  field :id, types.ID
  field :follower_id, types.ID
  field :following_id, types.ID
  field :created_at, types.String
end