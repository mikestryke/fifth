class SecretsController < ApplicationController
  before_action :set_secret, only: [:show, :edit, :update, :destroy]
  # before_action :require_login, only: [:index, :create, :destroy]
  before_action :current_user, only: [:index, :create, :update, :destroy]

  # GET /secrets
  # GET /secrets.json
  def index
    @secrets = Secret.all
  end

  # GET /secrets/1
  # GET /secrets/1.json
  def show
    @secret = Secret.all
  end

  # GET /secrets/new
  def new
    @secret = Secret.new
  end

  # GET /secrets/1/edit
  def edit
  end

  # POST /secrets
  # POST /secrets.json
  def create
    @secret = Secret.new(secret_params)

    respond_to do |format|
      if @secret.save
        format.html { redirect_to :back, notice: 'Secret was successfully created.' }
        format.json { render :show, status: :created, location: @secret }
      else
        format.html { render :new }
        format.json { render json: @secret.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /secrets/1
  # PATCH/PUT /secrets/1.json
  def update
    respond_to do |format|
      if @secret.update(secret_params)
        format.html { redirect_to @secret, notice: 'Secret was successfully updated.' }
        format.json { render :show, status: :ok, location: @secret }
      else
        format.html { render :edit }
        format.json { render json: @secret.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /secrets/1
  # DELETE /secrets/1.json
  def destroy
    secret = Secret.find(params[:id])
    Secret.destroy(secret.id)
    redirect_to :back, notice: 'Secret was successfully destroyed.'


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_secret
      @secret = Secret.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def secret_params
      params.require(:secret).permit(:description, :user_id)
    end
end
