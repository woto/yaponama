class CustomFailure < Devise::FailureApp
  def redirect_url
    #return super unless [:worker, :employer, :user].include?(scope) #make it specific to a scope
    #new_user_session_url(:subdomain => 'secure')
    puts pp params
    
    if params[:controller] == "devise/sessions" && params[:action] == "create"
      create_user_session_path
    else
      if params[:controller] == "orders" && params[:action] == "create"
        session["user_return_to"] = wishes_path
      end
      variants_path      
    end
  end
end