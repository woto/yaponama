class CustomFailure < Devise::FailureApp
  def redirect_url
    if params[:controller] == "sessions" && params[:action] == "create"
      create_user_session_path(:anchor => "jump")
    else
      if params[:controller] == "orders" && params[:action] == "create"
        session["user_return_to"] = wishes_path(:anchor => "jump")
      end
      variants_path(:anchor => "jump")
    end
  end
end
