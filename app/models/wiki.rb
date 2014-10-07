class Wiki < ActiveRecord::Base
    belongs_to :user
    has_many :collaborators
    has_many :users

default_scope { order('created_at DESC') }

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
