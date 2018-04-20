Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :login, function: Mutations::Login.new
  field :like, function: Mutations::Like.new
  field :disLike, function: Mutations::DisLike.new
  field :follow, function: Mutations::Follow.new
  field :unfollow, function: Mutations::UnFollow.new
  field :createUser, function: Mutations::CreateUser.new
  field :createMedia, function: Mutations::CreateMedia.new
end
