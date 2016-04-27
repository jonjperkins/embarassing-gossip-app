class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :new]
  
  def index
    @posts = Post.order(created_at: :desc).paginate(page: params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "Post successfully created!"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  private
    
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
    end
    
    def post_params
      params.require(:post).permit(:title, :body)
    end
  
end
