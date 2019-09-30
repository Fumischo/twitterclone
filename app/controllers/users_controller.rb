class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update,:destroy]


  def index
    @users = User.all
  end

  
  def new
    @user = User.new
  end
  


  def create
    @user = User.new(user_params)
    if params[:back]
      render :new
    else
    # User.create(user_params)
    if @user.save
      redirect_to users_path, notice:"Succeed!"
    else
      render :new
  end
 end
end

  
  def show
    # @user = User.find(params[:id])
  end



  def edit
    # @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: "投稿を編集しました！"
    else
      render :edit
    end
  end


  def destroy
    @user.destroy
    redirect_to users_path, notice:"投稿を削除しました！"
  end

  def confirm
    @user = User.new(user_params)
    render :new if @user.invalid?
  end
  
      private


      def user_params
        params.require(:user).permit(:content)
      end

      def set_user
        @user = User.find(params[:id])
      end

end
