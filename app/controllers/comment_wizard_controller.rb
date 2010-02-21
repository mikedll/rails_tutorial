class CommentWizardController < ApplicationController

  before_filter :require_post, :except => ["first", "second"]
  before_filter :build_comment, :except => ["first", "second"]

  after_filter :preserve_comment, :except => "first"

  def first
    @post_id = session[:comment][:post_id] if session[:comment]
    @posts = Post.all
  end

  def second
    redirect_to posts_url unless params[:post_id]
    @post = Post.find( params[:post_id] )
    @comment = @post.comments.build
  end

  def third
  end

  def fourth
    redirect_to edit_post_comment(@post,@comment) unless @comment.save
  end

private
  def require_post
    params[:comment].reverse_merge!( session[:comment].attributes )
    @post = Post.find( params[:comment][:post_id] )
  end
  
  def build_comment
    @comment = @post.comments.build( params[:comment] )
  end

  def preserve_comment
    session[:comment] = @comment
  end
end
