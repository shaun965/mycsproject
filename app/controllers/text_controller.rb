class TextController < ApplicationController

def text
end

def twilio
    #@phonenumber = phoneNumber
    if params[:a][0] != "+" or params[:a][1]!="1"
      redirect_to :text_controller
      flash.now[:danger] = 'Invalid email/password combination'
    elsif params[:a].length != 12
      binding.pry
      redirect_to :text_controller
      

    else 
      myString = String.new
      for i in 1..11
        binding.pry
        myString+=params[:a][i]
      end
      if myString.to_i.to_s.length != 11
        binding.pry
        redirect_to :text_controller
        return
      end
      account_sid = 'ACd1dc01cce6a4012d0e9612b53ad8d427'
      auth_token = '52460b1a51d616b764e075a47a848c68' 
 
    # set up a client to talk to the Twilio REST API 
      @client = Twilio::REST::Client.new account_sid, auth_token     
      @client.messages.create(
     #   from: '+13104992559',
          from: '+14242688216',
          to: params[:a],
          body: params[:q]
        )

      redirect_to :text_controller
    #render :text
    end
  end
end