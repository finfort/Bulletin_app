class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    #raise request.env['omniauth.auth'].to_yaml
    omniauth = request.env['omniauth.auth']
    user = User.from_omniauth(omniauth)
    if user.persisted?
      flash.notice = "Signed successfully."
      sign_in_and_redirect user
      #elsif current_user
      #  current_user.#authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      #  flash[:notice] = "Authentication successful."
      #  redirect_to #authentications_url
    else
      #session["devise.user_attributes"] = user.attributes
      #redirect_to new_user_registration_url
      user = User.from_omniauth(omniauth)
      user.zip = "00000"
      #user.save()
      if user.save
        flash[:notice] = "Signed in successfully..."
        sign_in_and_redirect(:user, user)
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    end
  end
  alias_method :twitter, :all
  alias_method :facebook, :all
  alias_method :google_apps, :all

end
