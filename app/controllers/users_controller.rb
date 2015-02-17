class UsersController <ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Account successfully created."
      redirect_to topics_path
    else
      flash[:notice] = "There was a problem creating your account. Please try again."
      render :new
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    @topics = @user.topics.all
   end 

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "Account was deleted."
    redirect_to topics_path
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "Update successful."
      redirect_to user_path(@user)
    else
    end
  end
end

private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end
