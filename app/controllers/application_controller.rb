# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_iPolling_session_id'
  
  private 
  
  
  def authorize
    unless session[:user_id]
      flash[:notice] =    " Please log in"
      session[:return_to] = request.request_uri
      redirect_to(:controller => "login", :action => "login")
    end
  end   
end
