class CollaboratorsController < ApplicationController

  before_filter :find_wiki

  def new
    @wiki = Wiki.find(params[:wiki_id])
    @users = User.all
    #@users.delete(current_user) 
    #@collaborators = Collaborators.new
  end

  def index
    @collaborators = Collaborator.all
    @users = User.all
  end             

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.build(params[:collaborator])
    
    if @collaborator.save
      flash[:notice] = "Successfully saved collaborator."
    else
      flash[:error] = "There was an error."
    end
    redirect_to action: :new
  end


  private

  def find_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end
end
