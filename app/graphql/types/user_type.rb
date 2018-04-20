Types::UserType = GraphQL::ObjectType.define do
  name 'User'
  field :id, types.ID
  field :username, types.String
  field :full_name, types.String
  field :profile_picture, types.String
  field :bio, types.String
  field :website, types.String
  field :counts do
    type Types::UserCountType
    resolve lambda { |user, _args, _ctx|
      user
    }
  end
  field :media do
    type types[Types::MediaType]
    resolve lambda { |user, _args, _ctx|
      user.media
    }
  end
  field :followed_by do
    type types[Types::UserType]
    resolve lambda { |user, _args, _ctx|
      user.followed_by_users
    }
  end
  field :follows do
    type types[Types::UserType]
    resolve lambda { |user, _args, _ctx|
      user.follow_users
    }
  end
  field :liked do
    type types[Types::MediaType]
    resolve lambda { |user, _args, _ctx|
      user.liked_media
    }
  end
end

Types::UserCountType = GraphQL::ObjectType.define do
  name 'UserCount'
  field :followed_by do
    type types.Int
    resolve lambda { |user, _args, _ctx|
      user.followed_by_users.count
    }
  end
  field :follows do
    type types.Int
    resolve lambda { |user, _args, _ctx|
      user.follow_users.count
    }
  end
  field :media do
    type types.Int
    resolve lambda { |user, _args, _ctx|
      user.media.count
    }
  end
end
