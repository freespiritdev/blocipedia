class WikisController < ApplicationController
   def index
     @wikis = Wiki.all
  end

  def new
    @wiki = Wiki.new
    @wiki = current_user.wikis.build(params[:wiki])
    authorize @wikis
  end

  def edit
    @wiki = Wikis.find(params[:id])
    authorize @wikis
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def create
    @wiki = Wiki.new(params[:wiki])
    authorize @wikis
    @wiki.user_id = current_user.user_id
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wikis
    @wiki.update_attributes(params[:wiki])  
  end
end
