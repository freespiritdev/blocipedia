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
    @wiki = Wiki.find(params[:id])

  end

  def create
    @wiki = current_user.wikis.build(wiki_params)
    if @wiki.save
      return redirect_to @wiki
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

  private

  def wiki_params
    params.require(:wiki).permit(:name, :public)
  end


end

