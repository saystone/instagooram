Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :login, function: Mutations::Login.new
end
