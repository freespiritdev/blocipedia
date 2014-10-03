class User < ActiveRecord::Base
  #extend FriendlyId
  #friendly_id :name, use: :slugged


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis
  

  
  def payment
    customer = Stripe::Customer.create(:card => token,:description => "avyishi@yahoo.com")
  end
end
