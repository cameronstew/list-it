class SessionsController < ApplicationController

  def new
  end

  def create

    uid = env['omniauth.auth']['uid']
    name = env['omniauth.auth']['info']['name']

    if name.split(" ").length > 2
      first_name = name.split(" ")[0]
      last_name = name.split(" ")[1]
    else
      first_name = name.split(" ")[0]
      last_name = name.split(" ")[2]
    end

    email = env['omniauth.auth']['info']['email']
    provider = env['omniauth.auth']['provider']

    user = User.find_or_create_by(oauth_user_id: uid)
    user.update_attributes(first_name: first_name, last_name: last_name, email: email, provider: provider) #update_attributes also includes .save

    # user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    if user.save
      redirect_to welcome_path
    else
      render :new, notice: "You must sign in"
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

end
