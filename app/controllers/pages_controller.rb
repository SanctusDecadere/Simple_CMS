class PagesController < ApplicationController

layout 'admin'


  before_action :confirm_logged_in

  before_action :find_subject


  before_filter :set_page_count, :only => [:new, :create, :edit, :update]


  

  def index
    @pages = @subject.pages.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new(:subject_id => @subject.id)
    @page_count = Page.count + 1
    #@subjects = Subject.sorted
  end

  def create
    @page = Page.new(page_params)
    @page.subject = @subject
    if @page.save
      flash[:notice] = "Page created Successfully"
      redirect_to(pages_path(:subject_id => @subject.id))
    else
      @page_count = Page.count + 1
      #@subjects = Subject.sorted
      render('new')
    end
  end


  def edit
    @page = Page.find(params[:id])
    @page_count = Page.count #before action set up.
    #@subjects = Subject.sorted
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page updated successfully"
      redirect_to(page_path(@page, :subject_id => @subject.id))
    else
      @page_count = Page.count #I set up a before action
      #@subjects = Subject.sorted 
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])

  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Page destroyed successfully"
    redirect_to(pages_path(:subject_id => @subject.id))
  end







  private

    def page_params
    params.require(:page).permit(:name, :position, :visible, :permalink)
  end


  def find_subject
    @subject = Subject.find(params[:subject_id])
    
  end


  def set_page_count
    @page_count = @subject.pages.count
    if params[:action] == 'new' || params[:action] == 'create'
      @page_count += 1
    end
  end

end
