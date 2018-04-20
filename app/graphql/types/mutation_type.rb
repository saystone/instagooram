Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :login, function: Mutations::Login.new
  field :like, function: Mutations::Like.new
  field :disLike, function: Mutations::DisLike.new
  field :follow, function: Mutations::Follow.new
  field :unfollow, function: Mutations::UnFollow.new
end
