class Collaborator < ActiveRecord::Base
 belongs_to :user
 belongs_to :wiki
  
  attr_accessor :email
  before_create :lookup_user

  def lookup_user
    self.user = User.find_by_email(self.email)
  end

  #  has_many :collaborators
end
