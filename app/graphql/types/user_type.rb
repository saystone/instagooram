Types::UserType = GraphQL::ObjectType.define do
  name "User"
  field :id, types.ID
  field :username, types.String
  field :full_name, types.String
  field :profile_picture, types.String
  field :bio, types.String
  field :website, types.String
  field :counts do
    type Types::UserCountType
    resolve -> (user, args, ctx) {
      user
    }
  end
  field :recentMedia do
    type types[Types::MediaType]
    resolve -> (user, args, ctx) {
      user.media
    }
  end
end

Types::UserCountType = GraphQL::ObjectType.define do
  name "UserCount"
  field :followers do
    type types.Int
    resolve -> (user, args, ctx) {
      user.followers.count
    }
  end
  field :followings do
    type types.Int
    resolve -> (user, args, ctx) {
      user.followings.count
    }
  end
  field :media do
    type types.Int
    resolve -> (user, args, ctx) {
      user.media.count
    }
  end
end
