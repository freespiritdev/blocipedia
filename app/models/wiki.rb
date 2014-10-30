class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users
  #has_many :users, through: :collaborators

  default_scope { order('created_at DESC') }

  #Checks for blank wiki and anything less than 2 characters
    validates :name, :length => { :minimum => 2} # This works
   
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  
  #def should_generate_new_friendly_id?
   # new_record?
  #end

  def is_collaborator?(user)
    users.include?(user)
  end

  def collaborator_for(user)
    collaborators.where(user_id: user.id).first
  end

end
