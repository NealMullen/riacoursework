class StaticsController < ApplicationController
  def home
  	@show_navbar = true
	#@posts = Post.search(params[:search]).paginate(:page => params[:page]).limit(2)
	@posts= Post.search(params[:search]).limit(2)
  end

  def about
  end

  def terms
  end
end
