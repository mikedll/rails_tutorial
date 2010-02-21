class CommentsController < ApplicationController
  
  before_filter :get_post
  before_filter :get_comment, :only => ["edit", "update", "destroy", "show"]

  def index
    @comments = @post.comments
  end

  def show
  end

  def new
    @comment = @post.comments.build
  end
  
  def create
    @comment = @post.comments.build( params[:comment] )
    if @comment.save
      redirect_to post_comment_url( @post, @comment )
    else
      render :action => "new"
    end
  end
  
  def update
    if @comment.update_attributes( params[:comment] )
      redirect_to post_comment_url( @post, @comment )
    else
      render :action => "edit"
    end
  end

  def edit
  end
  
  def destroy
    @comment.destroy
    redirect_to post_comments_path(@post)
  end

  private
  
  def get_post
    @post = Post.find( params[:post_id] )
  end
  
  def get_comment
    @comment = @post.comments.find( params[:id] )
  end

end
