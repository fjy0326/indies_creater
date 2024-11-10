class SessionsController < ApplicationController
  
  def destroy
    sign_out(resource_name)
    redirect_to tops
  end
  
end
