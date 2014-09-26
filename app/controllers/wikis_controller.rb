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
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user_id = current_user.user_id
  end

  def update
    @wiki = Wiki.find(params[:id])
  end
end
