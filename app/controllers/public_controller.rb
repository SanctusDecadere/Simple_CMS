class PublicController < ApplicationController

	layout 'public'


  before_action :setup_navigation


  def index
  	# Introductory text
  end

  def show
  	@page = Page.visible.where(:permalink => params[:permalink]).first
  	if @page.nil?
  		redirect_to(root_path)
  	else
  		# Display the page content using show.html.erb
  	end
  end



  def setup_navigation
    @subjects = Subject.visible.sorted

    
  end








end
