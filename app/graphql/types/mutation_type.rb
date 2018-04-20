Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :login, function: Mutations::Login.new
  field :like, function: Mutations::LikeMedia.new
  field :disLike, function: Mutations::DisLikeMedia.new
  field :follow, function: Mutations::FollowUser.new
  field :unfollow, function: Mutations::UnFollowUser.new
  field :createUser, function: Mutations::CreateUser.new
  field :createMedia, function: Mutations::CreateMedia.new
end
