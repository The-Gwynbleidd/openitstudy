class UsersController < ApplicationController
  before_action :find_user, only:[:show,:follow, :unfollow]

  def index
    @users = User.all
  end

  def show

  end

  def dashboard

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

  private

    def find_user
      @user = User.find(params[:id])
    end

end
