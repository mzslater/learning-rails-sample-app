class ViewerController < ApplicationController
  
  def show
    @page = Page.find_by_name(params[:name])
    @subpages = @page.subpages
    @pagetitle = @page.title
    login_required if @page.admin?
  end
  
  def get_unformatted_text
    @page = Page.find(params[:id])
    render :text => @page.body(:source)
  end
  
  def set_page_body
    @page = Page.find(params[:id])
    @page.update_attribute(:body, params[:value])
    render :text => @page.body
  end
  
end
