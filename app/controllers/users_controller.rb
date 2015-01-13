class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def show
    @country = Country.find(@user.country_id)
    @state = State.find(@user.state_id)
    @city = City.find(@user.city_id)
  end

  def new
    @user = User.new
    @countries = Country.all
    @states= []
    @cities = [] 
  end

	def create
		@user = User.new(user_params)
		respond_to do |format|
			if @user.save
				format.html { redirect_to @user, notice: 'User was successfully created.' }
				format.json { render action: 'show', status: :created, location: @user }
			else
				format.html { render action: 'new' }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

  def update_states
    country = Country.find(params[:country_id])
    @states = country.states.map{|a| [a.name, a.id]}    
  end

  def update_cities
	  state = State.find(params[:state_id])
	  @cities = state.cities.map{|s| [s.name, s.id]}
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :country_id, :state_id, :city_id)
    end
  
  end
