class PasswordResetsController < ApplicationController
  before_action :get_user, :valid_user, :check_expiration, only: %i(edit update)
  def new; end

  def edit; end

  def create
    @user = User.find_by email: params[:password_reset][:email].downcase
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = t "password_control.create.info"
      redirect_to root_url
    else
      flash.now[:danger] = "password_control.create.danger"
      render :new
    end
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, t("password_control.update.errors"))
      render :edit
    elsif @user.update user_params
      log_in @user
      @user.update_attribute(:reset_digest, nil)
      flash[:success] = t "password_control.success"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def get_user
    @user = User.find_by email: params[:email]
    return if @user

    flash[:warning] = t "password_control.create.found"
    redirect_to signup_path
  end

  def valid_user
    return if @user.activated? && @user.authenticated?(:reset, params[:id])

    flash[:warning] = t "password_control.validuser.warning"
    redirect_to root_url
  end

  def user_params
    params.require(:user).permit :password, :password_confirmation
  end

  def check_expiration
    return unless @user.password_reset_expired?

    flash[:danger] = t "password_control.check_expiration.danger"
    redirect_to new_password_reset_url
  end
end
