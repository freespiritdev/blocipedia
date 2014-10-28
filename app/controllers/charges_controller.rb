class ChargesController < ApplicationController

  def new
     @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: 'Premium Plan',
      amount: 9
    }
  end


  def create
  # Amount in cents
  @amount = 500

  customer = Stripe::Customer.create(
    email: current_user.email,
    card: params[:stripeToken]
  )

 

  current_user.update_attribute(:premium, true)

    redirect_to wikis_path, flash: {notice: 
      "Thank you for subscribing! You're ready to create wikis."}

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
end

before_filter :require_login

private

  def require_login
    unless current_user
      redirect_to edit_user_registration_path
    end
  end

end
