class Mutations::Like < GraphQL::Function
  argument :media_id, !types.ID
  type Types::LikeType

  def call(_obj, args, ctx)
    if ctx[:current_user].blank?
      raise GraphQL::ExecutionError, 'Authentication required'
    end

    media = Media.find(args['media_id'])
    return unless media

    like = ApplicationRecord::Like.where(
      user: ctx[:current_user],
      media: media
    ).first
    raise GraphQL::ExecutionError, 'Already liked' if like.present?

    ApplicationRecord::Like.create!(
      user: ctx[:current_user],
      media: media
    )
  end
end