class Medium::DocumentsController < ApplicationController
  def index
    @documents = Document.includes(:pages).all
  end

  def new
    @document = Document.create
    redirect_to medium_document_path(@document)
  end

  def show
    @document = Document.find params[:id]
    @page = @document.pages.first || @document.pages.build(header: '<h1>Header</h1>', body: 'Body')
  end

  def update
    @document = Document.find params[:id]
    update_document params[:content]
    respond_to do |format|
      format.json { head :ok }
    end
  end

  private

  def update_document content
    @document.pages.destroy_all
    page = Page.new header: content['header'][:value], body: content['body'][:value]
    @document.pages << page
  end

end
