class TopicsController <ApplicationController
  
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic = current_user.topics.build(topic_params)    
    if @topic.save
      flash[:notice] = "Topic successfully posted."
      redirect_to "/"
    else
      flash[:alert] = "There was a problem posting your topic to the forum. Please try again."
      render :new
    end
  end

  def show
    @topic = Topic.find_by_id(params[:id])
    @user = @topic.user
    @replies = @topic.replies.all
  end
end

private

def topic_params
  params.require(:topic).permit(:title, :user_id)
end