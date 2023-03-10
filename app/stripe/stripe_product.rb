class StripeProduct
  attr_reader :params, :product

  def initialize(params, product)
    @params = params
    @product = product
  end

  def currency_options
    params
      .fetch(:currency_options, [])
      .inject({}) do |acc, option|
        acc[option[:currency]] = {unit_amount: (option[:amount].to_f * 100).to_i}
        acc
      end
  end

  def create_product
    return if product.stripe_id.present?

    stripe_product = Stripe::Product.create({
      name: product.name,
      description: product.description,
      images: [
        # product.photo.representation(:medium).processed.url,
        # "https://doodleipsum.com/700/flat?i=191258f28a3672a5589de78d98ac7967",
        # Rails.application.routes.url_helpers.rails_blob_path(product.photo, only_path: true),
        # url_for(product.photo),
        # the .url is beacuse the direct upload true
        product.photo.url
      ],
      metadata: {
        user_id: product.user_id,
        product_id: product.id
      },
      default_price_data: {
        currency: params[:default_price_data][:currency],
        unit_amount: (params[:default_price_data][:amount].to_f * 100).to_i,
        currency_options: currency_options
      },
      expand: ['default_price'],
    },)

    product.update(
      stripe_id: stripe_product.id,
      data: stripe_product.to_json,
      stripe_price_id: stripe_product.default_price.id,
    )
  end

end
