class FishCatchesController < ApplicationController
  def create
    @fish_catch = current_user.fish_catches.build(fish_catch_params)
    @fishing_trip = @fish_catch.fishing_trip
    respond_to do |format|
      if @fish_catch.save
        format.js 
      else
      
      end
    end
  end
  
  def destroy
    @fish_catch = FishCatch.find(params[:id])
    fishing_trip = @fish_catch.fishing_trip.id
    @fish_catch.destroy
    
    respond_to do |format|
      format.js
      format.html do
          flash[:success] = "You deleted the fish"
         redirect_to fishing_trip_path(fishing_trip)
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
    
    def fishing_trip_params
      params.require(:fishing_trip_id)
    end
    
    def json_response(object, status = :ok)
      render json: object, status: status
    end
end
