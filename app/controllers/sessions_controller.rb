# Потребовалось из-за непоняток с форматом mobile
class SessionsController < Devise::SessionsController
  def show_become
    # Если пользователь не администратор или у него не устновлен id администратора
    redirect_to root_path(:anchor => "jump") and return if !current_user.admin? && !session[:admin_id]
    @user = User.find(params[:id])
    content_for :title, "Имперсонализация"
    respond_with @user
  end

  def become
    redirect_to root_path(:anchor => "jump") and return if !current_user.admin? && !session[:admin_id]

    if params[:id]
      sign_in(:user, User.find(params[:id]))
      session[:admin_id] = current_user.id
    else
      sign_in(:user, User.find(session[:admin_id]))
      session[:admin_id] = nil
    end

    redirect_to params[:referer] # or user_root_url 
  end
end
