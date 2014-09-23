class Post < ActiveRecord::Base
  extend
  attr_accessible :body, :title, :public
  has_many :collaborations
  has_many :users


end
