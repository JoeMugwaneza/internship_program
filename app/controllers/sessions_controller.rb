class SessionsController < Devise::SessionsController

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    if @user.admin == true
      redirect_to employers_path, notice: "Welcome back #{@user.last_name}!"
    else
      redirect_to user_path(@user), notice: "This is the Intern profile"
    end
  end

  # GET /resource/sign_out
  def destroy
    set_flash_message :notice, :signed_out if signed_in?(resource_name)
    sign_out_and_redirect(resource_name)
  end
end
