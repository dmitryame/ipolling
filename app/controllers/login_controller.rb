class LoginController < ApplicationController
  
  def login
    if request.post?
      random_string = params[:random_string]
      input_word = params[:input_word]
      if random_string.reverse + "124" == input_word
        session[:user_id] = random_string
        redirect_to :controller => 'poll', :action => 'index'
      end
    end 
    @random_string = random_string 5
  end
    
  
  
  private 
  
   def random_string(len)
    chars = ('a'..'z').to_a - ['a','e','i','o','u']
    code_array=[]
    1.upto(len) {code_array << chars[rand(chars.length)]}
    return code_array
  end
  
end
 