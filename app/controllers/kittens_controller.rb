class KittensController < ApplicationController
      def index
        kittens = Kitten.all

        render json: {
          status: "Success",
          message: "Render Articles",
          data:kittens
        },status: :ok
      end

      def show
        kitten = Kitten.find[params[:id]]
        render json: {
          status: "Success",
          message: "Render Articles",
          data:kitten
        },status: :ok
      end

      def create
        kitten = Kitten.create(kitten_params)
        
            if kitten.save
              render json: {
                status: "Success",
                message: "Created kittens",
                data: kitten
              },status: :ok
            else
              render json: {
                status: "Failed",
                message: "Not Created Kittens",
                data: kitten
              },status: :unprocessable_entity
            end
  
       end

      def update
          kitten = kitten.find[params[:id]]

              if kitten.update(kitten_params)
                render json: {
                  status: "Success",
                  message: "Updated Kittens",
                  data:kitten
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
        kitten = kitten.find[params[:id]]
        kitten.destroy
        render json: {
          status: "Success",
          message: "Deleted Kittens",
          # data:
        },status: :ok
      end

  private
  def kitten_params
    params.require(:kittens).permit(:name,:age,:cuteness,:softness)
  end

end