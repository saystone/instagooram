class Mutations::FollowUser < GraphQL::Function
  argument :user_id, !types.ID
  type Types::RelationshipType

  def call(_obj, args, ctx)
    if ctx[:current_user].blank?
      raise GraphQL::ExecutionError, 'Authentication required'
    end

    user = User.find(args['user_id'])
    return unless user

    relationship = Relationship.where(
      follow: ctx[:current_user],
      followed_by: user
    )
    raise GraphQL::ExecutionError, 'Already followed' if relationship.present?

    relationship.create!
  end
end