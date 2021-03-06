class CollaboratorsController < ApplicationController

  before_filter :find_wiki

  def new
    @wiki = Wiki.friendly.find(params[:wiki_id])
    @users = User.all
    @collaborators = Collaborator.all
  end

  def index
    find_wiki

  end             

  def create
    @wiki = Wiki.friendly.find(params[:wiki_id])
    @user = User.find(params[:collaborator][:user_id])
    @collaborator = Collaborator.create!(wiki_id: @wiki.id, user_id: @user.id)
    
    if @collaborator.save
      flash[:notice] = "Successfully saved collaborator."
    else
      flash[:error] = "There was an error."
    end
    render  :new
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
    params.require(:collaborator).permit(:user_id)
  end

  def find_wiki
    @wiki = Wiki.friendly.find(params[:wiki_id])
  end
end
