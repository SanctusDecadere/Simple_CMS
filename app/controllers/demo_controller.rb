class DemoController < ApplicationController

	layout 'application'

  def index
  	render('index')
  	#the index action is automatically rendering the index template unless you instruct otherwise.
  	#render('demo/hello')
  end


  def hello
  	@array = [1,2,3,4,5]
  	@id = params['id']
  	@page = params[:page]
  	render('hello')
  	#render("demo/index")
  end

  def other_hello
  	redirect_to(:action => 'hello')
  end

  def lynda
  	redirect_to('http://lynda.com')
  end

end
