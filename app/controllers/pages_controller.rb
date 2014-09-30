class PagesController < ApplicationController
  def show
    @wiki = Wiki.find(params[:wiki_id])
    @page = Page.find(params[:id])
    end

    def new
      @wiki = Wiki.find(params[:wiki_id])
      @page = Page.new
      authorize @page
    end

    def create
    @wiki = Wiki.find(params[:wiki_id])
    @page = current_user.pages.build(params[:page])
    @page.wiki = @wiki

    authorize! :create, @page, message: "You need to be signed up to do that."
    if @page.save
      redirect_to [@wiki, @page], notice: "Page was saved successfully."
    else
      flash[:error] = "There was an error saving the page. Please try again."
      render :new
    end

    def edit
      @wiki = Wiki.find(params[:wiki_id])
      @page = Page.find(params[:id])
    end

    def update
    @wiki = Wiki.find(params[:wiki_id])
    @page = Page.find(params[:id])
    end
  end
  private

  def page_params
  params.require(:page).permit(:title, :body)
  end
end
