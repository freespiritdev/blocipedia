class CollaboratorsController < ApplicationController

  before_filter :find_wiki

  def new
    @wiki = Wiki.find(params[:wiki_id])
    @users = User.all
    @collaborators = Collaborator.all
    @users.delete(current_user) 
    #@collaborators = Collaborators.new
  end

  def index
    @collaborators = Collaborator.all
    @users = User.all
  end             

  def create
    @wiki = Wiki.friendly.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.build(collaborator_params)
    
    if @collaborator.save
      flash[:notice] = "Successfully saved collaborator."
    else
      flash[:error] = "There was an error."
    end
    redirect_to action: edit_wiki(@wiki)
    #redirect_to action: edit_wiki_collaborator(@wiki)
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    
    if @collaborator.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
    else
      flash[:error] = "There was an error deleting the collaborator."
    end
    redirect_to wiki_collaborators_path(@wiki)
  end

  private

  def collaborator_params
    params.require(:collaborator).permit(:wiki_id, :id)
  end

  def find_wiki
    @wiki = Wiki.friendly.find(params[:wiki_id])
  end
end
