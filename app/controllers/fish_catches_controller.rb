class FishCatchesController < ApplicationController
  before_action :correct_user, only: [:create, :destroy]
  
  def create
    @fish_catch = current_user.fish_catches.build(fish_catch_params)
    @fishing_trip = @fish_catch.fishing_trip
    respond_to do |format|
      if @fish_catch.save
        format.html do
          flash[:success] = "Nice Catch!"
          redirect_to fishing_trip_path(@fishing_trip)
        end
        format.js 
      else
        format.json {render 'create_error.json', status: 422}
      end
    end
  end
  
  def destroy
    @fish_catch = FishCatch.find(params[:id])
    fishing_trip = @fish_catch.fishing_trip.id
    
    respond_to do |format|
      if @fish_catch.destroy
        format.js
        format.html do
          flash[:success] = "You deleted the fish"
          redirect_to fishing_trip_path(fishing_trip)
        end
      else
        format.json format.json { render json: { error: "Could not update picture. Please try again later", status: 422 } } 
      end
    end
  end
  
  def index
    set_query_params
    error_message = params_error_messages
    
    if error_message
      json_response({error: error_message})
    else
      @fish_catches = FishCatch.find_top_fish(@sort_field, @limit, @type, @user_id)
      
      render 'top_fish.json', status: 200
    end
  end
  
  private
    def correct_user
      user = FishCatch.find(params[:id]).user
      redirect_to root_url, status: 403 unless current_user?(user)
    end
    
    def set_query_params
      @sort_field = params[:sortBy] || "weight"
      @limit = params[:limit] ? params[:limit].to_i : 10
      @type = params[:type].to_i if params[:type]
      @user_id = params[:user_id].to_i if params[:user_id]
    end
    
    def params_error_messages
      if ! %w(weight length).include? @sort_field
        "sortBy invalid"
      elsif @limit <= 0
        "Limit must be greater than 0"
      elsif @limit > 50
        "Limit must be less than 50. Try pagination instead"
      end
    end
    
    def fish_catch_params
      params.require(:fish_catch).permit(:length, :weight, :fish_type_id, 
                                         :image, :fishing_trip_id)

    end
    
    def json_response(object, status = :ok)
      render json: object, status: status
    end
end
