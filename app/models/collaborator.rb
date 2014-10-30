class Collaborator < ActiveRecord::Base
 belongs_to :user
 belongs_to :wiki

 #attr_accessor :email, :name #removing this causes an error with the edit wiki option

  #Stops from adding more collaborators to a wiki
  validates :user_id, :uniqueness => {:message => "Already added!"}
 
end
