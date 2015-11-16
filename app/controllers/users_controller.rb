class UsersController < ApplicationController
  before_action :find_user, only:[:show,:follow, :unfollow]

  def index
    @users = User.paginate(:page => params[:page], :per_page => 32)
  end

  def show
    @follow = @user.all_following.take(12)
    @followers = @user.followers.take(12)
  end

  def dashboard

  end

  def search
    if params[:search].present?
      @users = User.search(params[:search])
    else
      @users = User.paginate(:page => params[:page], :per_page => 30).order("created_at ASC")
    end
  end

  def follow
    current_user.follow(@user)
    respond_to do |format|
      format.html {redirect_to :back}
      format.js {render layout: false}
    end
  end

  def unfollow
    current_user.stop_following(@user)
    respond_to do |format|
      format.html {redirect_to :back}
      format.js {render layout: false}
    end
  end

  def following
    @user = User.friendly.find(params[:id])
    @following = @user.all_following
  end

  def followers
    @user = User.friendly.find(params[:id])
    @followers = @user.followers
  end

  private

    def find_user
      @user = User.friendly.find(params[:id])
    end

end
