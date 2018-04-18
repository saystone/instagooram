Types::UserType = GraphQL::ObjectType.define do
  name "User"
  field :id, types.ID
  field :username, types.String
  field :full_name, types.String
  field :profile_picture, types.String
  field :bio, types.String
  field :website, types.String
  field :followers, types[Types::UserType]
  field :followings, types[Types::UserType]
  field :media, types[Types::MediaType]
end
