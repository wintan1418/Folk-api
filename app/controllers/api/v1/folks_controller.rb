class Api::V1::FolksController < ApplicationController
    def index
        folks = Folk.all 

        if folks
            render json: {status: "SUCCESS", message: "successfully rendered", data: folks}, status: :ok
        else
            render json: folks.errors, status: :bad_request
        end
    
    end

    def create
        folk = Folk.new(folk_params)

        if folk.save
            render json: {status: "SUCCESS", message: "you earned a folk", data: folk}, status: :created
        else
            render json: folks.errors, status: :unprocessabble_entity

        end
    end

    def show
        folk = Folk.find(params[:id])

        if folk
            render json: {data: folk}, state: :ok
        else
            render json: {message: "no friend record"}, status: :bad_request
        end
    end

    def destroy
        folk = Folk.find(params[:id])

        if folk.destroy!
            render json: {message: "successfully deleted"}, status: :ok
        else
         render json: {message: "no record"}, status: :bad_request   
        end
    end
    

    def update
        folk = Folk.find(params[:id])

        if folk.update!(folk_params)
            render json: {message: "folk updated successfully"}, status: :ok
        else
            render json: {message: "folk cannot be updated"}, status: :unprocessable_identity

        end    
    end
    private

    def folk_params
        params.require(:folk).permit(:name, :phone, :twitter, :email, :location )
    end
end