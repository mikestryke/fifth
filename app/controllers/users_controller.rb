class UsersController < ApplicationController
  # before_action :require_login, except: [:new, :create]
  before_action :current_user, only: [:show, :edit, :update, :destroy]
  # before_action :require_current_user, only: [ :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  # GET /users
  # GET /users.json
  def index

  end

  # GET /users/1
  # GET /users/1.json
  def show
    @secret = User.find(params[:id]).secrets.order(created_at: :desc)
    @like = User.find(params[:id]).likes.order(created_at: :desc)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to :root, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end


  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json

  def login
    @user = User.find_by_email(params[:email])
      respond_to do |format|
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'Logged in successfully.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to :back }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :back, notice: "failed" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
