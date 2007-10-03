require 'open-uri'

class LoginController < ApplicationController
  
  def login
    if request.post?
      answer = params[:captcha]
      answer  = answer.gsub(/\W/, '')
      
      if open("http://captchator.com/captcha/check_answer/pizza#{session.session_id}/#{answer}").read.to_i == 0
          session[:user_id] = nil
        flash[:notice] = "Try Again";
      else
        session[:user_id] = answer
        redirect_to :controller => 'poll', :action => 'index'
      end
    end

  end
    
  
  
  private 
  
  
end
 