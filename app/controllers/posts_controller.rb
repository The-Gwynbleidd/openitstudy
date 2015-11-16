class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      respond_to do |format|
        format.html {redirect_to :back}
        format.js {render layout: false}
      end
    else
      render 'new'
    end
  end

  private

    def post_params
      params.require(:post).permit(:body)
    end

end
