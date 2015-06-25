class StaticPagesController < ApplicationController
  def home
  	if logged_in?
    	@micropost = Micropost.new #current_user.microposts.build
    	@feed_items = current_user.feed
      #.paginate(page: params[:page])
      #2@feed_items = current_user.feed.page(params[:page])
      #@feed_items = current_user.microposts.page(1)
  	end
  end

  def help
  end

  def about
  end

  def contact
  end
  
end
