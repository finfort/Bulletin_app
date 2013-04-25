class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
  end

  def create
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to advertisement_url(@comment.advertisement)
    else
      render :action => 'new'
    end
  end

  def edit
    @comment = Comment.find(params[:comment])
  end

  def update
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Successfully updated comment."
      redirect_to advertisement_url(@comment.advertisement)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = "Successfully destroyed comment."
    redirect_to advertisement_url(@comment.advertisement)
  end
end
