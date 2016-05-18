class PostsController < ApplicationController
  before_action :find_post, only: [:show, :destroy, :edit]
  def index
    @posts = Post.all
    respond_to do |format|
      format.html{}
      format.json{render json: @posts}
    end
  end
  def new
  	@post = Post.new
  end
  def create
  	@post = Post.new(post_params)
  	if @post.save
  	  respond_to do |format|
        format.html{}
  	  	format.json{ render json: @post} 
  	  end
      redirect_to root_path
  	else
  	  respond_to do |format|
  	  	format.html{}
  	  end
      render :new
  	end
  end
  def show
    respond_to do |format|
      format.html{}
      format.json{render json: @post}
    end
  end
  def destroy
  end
  private
  def post_params
  	params.require(:post).permit(:title, :body)
  end
  def find_post
    @post = Post.find(params[:id])
  end

end
