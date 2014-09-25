class Wiki < ActiveRecord::Base
    has_many :collaborations
  has_many :users
end
