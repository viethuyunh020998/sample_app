class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.image.attach(params[:micropost][:image])
    if @micropost.save
      flash[:success] = t "micropost.controller.success"
      redirect_to root_url
    else
      create_fails
    end
  end

  def destroy
    if @micropost.destroy
      flash[:success] = t "micropost.controller.destroy"
    else
      flash[:warning] = t "micropost.controller.warning"
    end
    redirect_to request.referer || root_url
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :image)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    return if @micropost

    flash[:danger] = t "microposts.access_error"
    redirect_to root_path
  end

  def create_fails
    @feed_items = current_user.feed.paginate(page: params[:page])
    render "static_pages/home"
  end
end
