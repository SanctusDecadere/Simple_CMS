class SubjectsController < ApplicationController

layout 'admin'
  
  before_action :confirm_logged_in

  #before_action :count_subjects, :only => [:new, :create, :edit, :update ]
  def index
    #logger.debug("*** Testing the logger. ***")
    @subjects = Subject.sorted
    @page_title = "All Subjects"
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => 'Default'})
    @subject_count = Subject.count + 1
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:notice] = "Subject was created successfully"
      redirect_to(subjects_path)
    else
      @subject_count = Subject.count + 1
      render('new')
    end
    
  end



  def edit
      @subject = Subject.find(params[:id])
      @subject_count = Subject.count
  end



  def update
    @subject = Subject.find(params[:id])
   #@subject = Subject.new(subject_params)

    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject was updated successfully"

      redirect_to(subject_path(@subject))
    else

      @subject_count = Subject.count + 1

      render('edit')
    end
  end



  def delete
    @subject = Subject.find(params[:id])
  end






  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy

    #render('index') does not work

    flash[:notice] = "Subject '#{@subject.name}' destroyed successfuly"
    redirect_to(subjects_path)
  end


  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible, :created_at)
  end

  #def count_subjects
    #@subject = Subject.count
    #if params[:action] == 'new' || params[:action] == 'create' || params[:action] == 'update'
    #  @subject += 1
    #end
  #end



end


