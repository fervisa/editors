class DocumentsController < ApplicationController
  def index
    @documents = Document.includes(:pages).all
  end

  def new
    @document = Document.create
    redirect_to "/editor#{ document_path(@document) }"
  end

  def show
    @document = Document.find params[:id]
  end

  def update
    @document = Document.find params[:id]
    update_document params[:content]
    respond_to do |format|
      format.json { render json: { text: '{}' } }
    end
  end

  private

  def update_document content
    @document.pages.destroy_all
    number_pages = content.length / 2
    (1..number_pages).each do |n|
      page = Page.new header: content["header-#{n}"][:value], body: content["body-#{n}"][:value]
      @document.pages << page
    end
  end

end
