class Mutations::CreateMedia < GraphQL::Function
  argument :media_type, !types.String
  argument :images, !types.String
  argument :filter, types.String
  argument :shortcode, types.String
  argument :videos, types.String
  type Types::MediaType

  def call(_obj, args, ctx)
    if ctx[:current_user].blank?
      raise GraphQL::ExecutionError, 'Authentication required'
    end

    Media.create!(
      user: ctx[:current_user],
      media_type: args['media_type'],
      images: args['images'] ? JSON.parse(args['images']) : null,
      filter: args['filter'],
      shortcode: args['shortcode'],
      videos: args['videos'] ? JSON.parse(args['videos']) : null
    )
  end
end