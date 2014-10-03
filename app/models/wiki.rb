class Wiki < ActiveRecord::Base
    belongs_to :user
    has_many :collaborations
    has_many :users

    #extend FriendlyId
    #friendly_id :name, use: [:slugged, :history]

    #def create_new_friendly_id?
    #new_record?
    #end
end
