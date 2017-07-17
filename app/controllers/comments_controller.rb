class CommentsController < ApplicationController

  def create
    @job = Job.find(params[:job_id])
    @comment = Comment.new(comment_params.merge(job: @job))

    if @comment.save
      flash[:success] = "You created a comment for #{@comment.job.title}"
    else
      flash[:notice] = "Comment can't be blank!"
    end
    redirect_to job_path(@job)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :created_at, :updated_at)
  end
end
