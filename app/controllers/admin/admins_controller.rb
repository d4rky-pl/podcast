class Admin::AdminsController < ApplicationController
  include Administrable
  before_action :set_admin, only: [:show, :edit, :update, :destroy]

  # GET /admin/admins
  def index
    @admins = Admin.page(params[:page]).per(params[:per_page])
  end

  # GET /admin/admins/1
  def show
  end

  # GET /admin/admins/new
  def new
    @admin = Admin.new
  end

  # GET /admin/admins/1/edit
  def edit
  end

  # POST /admin/admins
  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to [:admin, @admin], notice: 'Admin was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /admin/admins/1
  def update
    if @admin.update(admin_params)
      redirect_to [:admin, @admin], notice: 'Admin was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /admin/admins/1
  def destroy
    @admin.destroy
    redirect_to admin_admins_url, notice: 'Admin was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_params
      filtered_params = params.require(:admin).permit(:display_name, :email, :password, :password_confirmation)
      if filtered_params[:password] == ""
        filtered_params.delete(:password)
        filtered_params.delete(:password_confirmation)
      end
      filtered_params
    end
end
