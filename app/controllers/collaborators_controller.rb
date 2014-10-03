class CollaboratorsController < ApplicationController

   def index
    @users = User.where("id is not ?", current_user.id)
  end


  def new
    @collaborator = Collaborator.new
  end

  def edit
  end

  def create
    @collaborator = @wiki.collaborators.build(id: params[:id])
    if @collaborator.save
      flash[:notice] = "You added a collaborator"
    else
      flash[:error] = "There was a problem creating this collaborator"
    end

    redirect_to wiki_collaborators_path(@wiki)
  end

  def update
    @collaborator = Collaborator.find(params[:id])

    render :edit
  end

  def destroy
    @wikis = Wiki.find(params[:wiki_id])  
    @collaborator = @wiki.collaborators.find(params.require(:collaborator).permit(:user_id, :wiki_id))
    
    if @collaborator.destroy
      flash[:notice] = "Collaborator was removed."
    else
      flash[:error] = "Collaborator couldn't be removed. Please try again."
    end

  end


  private

  def collaborator_params
    params.require(:collaborator).permit(:name, :wiki_id)
  end
end
