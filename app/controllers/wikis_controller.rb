class WikisController < ApplicationController
   def index
     @wikis = Wiki.all
  end

  def new
    @wiki = Wiki.new
    @wiki = current_user.wikis.build(params[:wiki])
  end

  def edit
    @wiki = Wikis.find(params[:id])
    authorize @wikis
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def create
    @wiki = current_user.wikis.build(params[:wiki])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.update_attributes(params[:wiki])  
  end
end
