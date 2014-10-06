class CollaboratorsController < ApplicationController
  before_filter :find_wiki

  def new
    @wiki = Wiki.find(params[:wiki_id])
    @users = User.all
    @users.delete(current_user) 
    @collaborators = Collaborators.new
  end

  def index
    @collaborators = Collaborator.all
  end

  def create
    @wiki.collaborators.delete_all
    @collaborators = []
    params[:collaborators][:user_id].each do |user_id|
      @collaborators << Collaborators.create(id: id, wiki_id: @wiki.id)
  end
  redirect_to @wiki
end



  private

  def find_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end
end
