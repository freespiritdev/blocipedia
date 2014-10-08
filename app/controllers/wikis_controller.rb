class WikisController < ApplicationController
  
  def index
     @wikis = Wiki.all
     @wikis = current_user.wikis.paginate(page: params[:page], per_page: 10)

  end

  def new
    @wiki = Wiki.new
    #@wiki = current_user.wikis.build(params[:wiki])
  end

  def edit
    @wiki = Wiki.friendly.find(params[:id])
    #@wiki = Wiki.find(params[:id])
  end

  def show
   #@wiki = current_user.wikis.find(params[:id])
    @wiki = Wiki.friendly.find(params[:id])
    #@wiki = Wiki.find(params[:id])
      #if request.path != wiki_path(@wiki)
        # redirect_to @wiki, status: :moved_permanently
      #end

  end

  def create
    @wiki = current_user.wikis.build(wiki_params)
    if @wiki.save
      flash[:notice] = "Awesome, wiki was created successfully!"
      redirect_to @wiki
    else
      flash[:error] = "There was an error creating the wiki. Please try again"
      render :new
    end
  end


  def update
    @wiki = Wiki.friendly.find(params[:id])
    #@wiki = Wiki.find(params[:id])
    if @wiki.update_attributes(wiki_params)
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
      else
       flash[:error] = "There was an error saving the wiki. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.friendly.find(params[:id])
    #@wiki = Wiki.find(params[:id])
    name = @wiki.name

     if @wiki.destroy
       flash[:notice] = "\"#{name}\" was deleted successfully."
       redirect_to wikis_path
     else
       flash[:error] = "There was an error deleting the wiki."
       render :show
     end
   end

before_filter :check_for_cancel, :only => [:create, :update]

def check_for_cancel
  if params[:commit] == "cancel"
    redirect_to wikis_path
  end
end

  private

  def wiki_params
    params.require(:wiki).permit(:name, :private)
  end


end

