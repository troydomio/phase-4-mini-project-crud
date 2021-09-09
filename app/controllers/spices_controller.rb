class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
   
    def index 
        render json: Spice.all
    end

    def show 
        render json: get_id
    end

    def create 
        render json: Spice.create(spice_params), status: :created
    end
    
    def update 
       spice = get_id
        render json: spice.update(spice_params)
    end

    def destroy
        spice = get_id
        spice.destroy
        head :no_content
    end

    private

    def spice_params 
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def get_id 
        Spice.find(params[:id])
    end

    def render_not_found_response 
        render json: {error: "Spice not found"}, status: :not_found
    end
end
