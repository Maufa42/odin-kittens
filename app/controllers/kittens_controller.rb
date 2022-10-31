class KittensController < ApplicationController
  before_action :authenticate_user!
  before_action :set_kittens, only: %i[show update destroy ]
      def index
        kittens = Kitten.all.order("created_at DESC")

        render json: {
          status: "Success",
          message: "Render Kittens",
          data:kittens
        },status: :ok
      end

      def show
           
            if @kitten
            render json: {
              status: "Success",
              message: "Render Kitten",
              data:@kitten
            },status: :ok
            else
              render json: {
                status: "Failed",
                message: "Kitten Not Existed",
                data:@kitten
              },status: :ok
            end
      end

      def create
        @kitten = Kitten.create(kitten_params)
        
            if @kitten.save
              render json: {
                status: "Success",
                message: "Created kittens",
                data: @kitten
              },status: :ok
            else
              render json: {
                status: "Failed",
                message: "Not Created Kittens",
                data: @kitten
              },status: :unprocessable_entity
            end
  
       end

      def update
          # kitten = Kitten.find(params[:id])

              if @kitten.update(kitten_params)
                render json: {
                  status: "Success",
                  message: "Updated Kittens",
                  data:@kitten
                },status: :ok
              else
                render json: {
                  status: "Failed",
                  message: "Updated Kittens",
                  # data:kitten
                },status: :unprocessable_entity
              end
      end

      def destroy
        # kitten = Kitten.find(params[:id])
        @kitten.destroy
        render json: {
          status: "Success",
          message: "Deleted Kittens",
          data:@kitten
        },status: :ok
      end



  private

  def kitten_params
    params.require(:kitten).permit(:name,:age,:cuteness,:softness)
  end

  def set_kittens
    @kitten = Kitten.find(params[:id])
  end

end