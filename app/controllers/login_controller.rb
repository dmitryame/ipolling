require 'open-uri'

class LoginController < ApplicationController
  
  def login
    if request.post?
          answer = params[:captcha]
          answer  = answer.gsub(/\W/, '')
          openUrl = open("http://captchator.com/captcha/check_answer/ipoll_#{params[:session_id].to_i}/#{answer}").read.to_i
      
      if openUrl == 0
          session[:user_id] = nil
        flash[:notice] = "Try Again";
      else
        session[:user_id] = answer
        session[:return_to] ? redirect_to(session[:return_to]) : redirect_to(default)
        session[:redirect_to] = nil
      end
    end

  end
    
  
  
  private 
  
  
end
 