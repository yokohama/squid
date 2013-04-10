class UserController < DashboardController
  before_filter :authenticate_user!, only: [:edit, :update, :destroy]
  before_filter :authenticate_admin!, only: [:index]
  before_filter :authenticate_investor!, only: [:index]

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.all(:order => 'created_at desc')
  end

  def show
    if current_user && @user.id != current_user.id
      redirect_to dashboard_path
      #raise 'Hitonoha mirenaiyo! Exception'
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        current_user = @user
        format.html { redirect_to @user, notice: 'user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to user_index_url }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit([:sei, :mei])
    end
end
