class WikisController < ApplicationController
  def index
     @wikis = Wiki.all
  end

  def new
    @wiki = Wiki.new
    @wiki = current_user.wikis.build(params[:wiki])
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def show
    @wiki = current_user.wikis.find(params[:id])
    @wiki = Wiki.find(params[:id])

  end

  def create
    @wiki = current_user.wikis.build(wiki_params)
    if @wiki.save
      flash[:notice] = "Awesome, wiki was created successfully!"
      return redirect_to @wiki
    else
      flash[:error] = "There was an error creaeting the wiki. Please try again"
  end
    render :new
  end

  def update
    @wiki = Wiki.find(params[:id])
    if @wiki.update_attributes(wiki_params)
      return redirect_to @wiki
    end
    render :edit
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    name = @wiki.name

     if @wiki.destroy
       flash[:notice] = "\"#{name}\" was deleted successfully."
       redirect_to wikis_path
     else
       flash[:error] = "There was an error deleting the wiki."
       render :show
     end
   end


  private

  def wiki_params
    params.require(:wiki).permit(:name, :private)
  end


end

