class Mutations::LikeMedia < GraphQL::Function
  argument :media_id, !types.ID
  type Types::LikeType

  def call(_obj, args, ctx)
    if ctx[:current_user].blank?
      raise GraphQL::ExecutionError, 'Authentication required'
    end

    media = Media.find(args['media_id'])
    return unless media

    like = Like.where(
      user: ctx[:current_user],
      media: media
    )
    raise GraphQL::ExecutionError, 'Already liked' if like.present?

    like.create!
  end
end