Types::MediaType = GraphQL::ObjectType.define do
  name 'Media'
  field :id, types.ID
  field :media_type, types.String
  field :images, types.String
  field :videos, types.String
  field :filter, types.String
end
