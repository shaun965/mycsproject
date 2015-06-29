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


  def twilio
    binding.pry
    #@phonenumber = phoneNumber
    account_sid = 'ACd1dc01cce6a4012d0e9612b53ad8d427' 
    auth_token = '52460b1a51d616b764e075a47a848c68' 
 
    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new account_sid, auth_token     
    @client.messages.create(
        from: '+14242688216',
        to: '+14242704368',
        body: message
        )
  end



  def help
  end

  def about
  end

  def contact
  end
  
end
