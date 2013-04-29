class CommentsController < ApplicationController
  load_and_authorize_resource
###################
  def create
    @advertisement= Advertisement.find(params[:advertisement_id])
    @comment = @advertisement.comments.new(params[:comment])
    @comment.user = current_user
      if @comment.save
        flash[:notice] = "Successfully created comment."
        respond_to do |format|
          format.html {
          redirect_to advertisement_url(@comment.advertisement)}
          format.js
        end
       else
        render :action => 'new'
    end
  end

  def show
    @advertisement= Advertisement.find(params[:advertisement_id])
    @comment = Comment.find(params[:id])
  end

  def edit
    @advertisement= Advertisement.find(params[:advertisement_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Successfully updated comment."
      redirect_to advertisement_url(@comment.advertisement)
      #redirect_to advertisement_url(@comment.advertisement, @comment)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html {
      flash[:notice] = "Successfully destroyed comment."
      redirect_to advertisement_url(@comment.advertisement)}
      format.js
    end
  end
end
