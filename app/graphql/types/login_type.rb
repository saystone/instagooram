Types::LoginType = GraphQL::ObjectType.define do
  name 'Login'

  field :token, types.String
  field :user, Types::UserType
end