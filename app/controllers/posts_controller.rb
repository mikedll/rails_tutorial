class PostsController < ApplicationController

  before_filter :get_post, :only => [ "destroy", "show", "edit", "update" ]

  def create
    @post = Post.new( params[:post] )
    
    respond_to do |format|
      if @post.save
        flash[:notice] = "Post was created successfully."
        format.html { redirect_to @post }
        format.xml { render :xml => @post, :status => :created, :location => @post }
      else
        format.html
        format.xml { render :xml => @post.errors, :status => :unprocessible_entity }
      end
    end    
  end
  
  def index
    @posts = Post.all
    
    respond_to do |format|
      format.html { render :action => "index" }
      format.xml { render :xml => @posts }
    end
  end
  
  def update
    if @post.update_attributes( params[:post] )
      redirect_to @post
    else
      render :action => "edit"
    end
  end
  
  def edit
  end
  
  def new
    @post = Post.new
  end
  
  def destroy
    @post.destroy
  end
  
  def show
    respond_to do |format|
      format.html
      format.xml { render :xml => @post }
    end
  end
  
  private
  
  def get_post
    @post = Post.find( params[:id] )
  end
  
end
