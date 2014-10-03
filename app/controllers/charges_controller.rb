class ChargesController < ApplicationController

  def new
     @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: 'Premium Plan',
      amount: 6
    }
  end


  def create
  # Amount in cents
  @amount = 500

  customer = Stripe::Customer.create(
    email: current_user.email,
    card: params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    customer:  customer.id,
    amount:    @amount,
    description: 'Premium Customer',
    currency: 'usd'
  )

  current_user.update_attribute(:premium, true)

    redirect_to wikis_path, flash: {notice: 
      "Thank you for subscribing! You're ready to create wikis."}

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
end
end
