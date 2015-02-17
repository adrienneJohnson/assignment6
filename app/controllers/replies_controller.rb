class RepliesController <ApplicationController
  def new
    @reply = Reply.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @reply = @topic.replies.build(reply_params)
    if @reply.save
      redirect_to topic_path(@topic)
    end
  end
end
  
private

def reply_params
  params.require(:reply).permit(:title, :body, :user_id)
end
