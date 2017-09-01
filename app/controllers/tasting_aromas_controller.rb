# class TastingAromasController < ApplicationController
#   skip_before_action :authenticate_user!, only: [:new, :create, :edit, :update]

#   def new
#     @tasting_aromas = TastingAroma.new
#   end

#   def create
#     find_tasting
#     @tasting_aromas = @tasting.tasting_aromas.build(tasting_aromas_params)
#     @tasting_aromas.save
#   end

#   def edit
#     find_tasting
#     @tasting_aromas = TastingAroma.find(params[:id])
#   end

#   def update
#     find_tasting
#     authorize @tasting_aromas
#   end

#   private
#   def tasting_aromas_params
#     params.require(:tasting_aromas).permit(:content)
#   end
#   def find_tasting
#     @tasting = Tasting.find(params[:tasting_id])
#   end
# end
