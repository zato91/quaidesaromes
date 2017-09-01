class TastingsController < ApplicationController
  layout "application"
  skip_before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def new
    @wine = Wine.find(params[:wine_id])
    @tasting = @wine.tastings.new
    authorize @tasting
    @tasting.tasting_aromas.build
    @submit_label_aroma = "Ajouter un arôme"
    @submit_label = "Ajouter ma dégustation"
    @aroma_collection = []
    @aromas = Aroma.all
    @aromas.each do |aroma|
      @aroma_collection << aroma.id
    end
  end

  def create
    @wine = Wine.find(params[:wine_id])
    @tasting = @wine.tastings.new(tasting_params)
    authorize @tasting
    @tasting.save
    @wine.save
    @sweetness = 0
    @acidity = 0
    @tannins = 0
    @body = 0
    @length = 0
    @counter = 0
    @wine.tastings.each do |tasting|
      if (Time.now - tasting.created_at)/ 86400 > 365
      else
        @sweetness += tasting.sweetness
        @acidity += tasting.acidity
        @tannins += tasting.tannins
        @body += tasting.body
        @length += tasting.length
        @counter += 1
      end
    end
    @wine.sweetness = @sweetness / @counter
    @wine.acidity = (@acidity.to_f / @counter * 3 / 5).round
    @wine.tannins = (@tannins.to_f / @counter * 3 / 5).round
    @wine.body = (@body.to_f / @counter * 3 / 5).round
    @wine.length = (@length.to_f / @counter * 3 / 5).round
    @wine.tasting_color = @wine.tastings.last.color
    @wine.save
    redirect_to wine_path(@wine)

  end

  def edit
    @wine = Wine.find(params[:wine_id])
    @tasting = Tasting.find(params[:id])
    @submit_label = "Modifier ma dégustation"
    authorize @tasting
  end

  def update
    @wine = Wine.find(params[:wine_id])
    @tasting = Tasting.find(params[:id])
    authorize @tasting
    @tasting.update(tasting_params)
    @tasting.save
    @sweetness = 0
    @acidity = 0
    @tannins = 0
    @body = 0
    @length = 0
    @counter = 0
    @wine.tastings.each do |tasting|
      if (Time.now - tasting.created_at)/ 86400 > 365
      else
        @sweetness += tasting.sweetness
        @acidity += tasting.acidity
        @tannins += tasting.tannins
        @body += tasting.body
        @length += tasting.length
        @counter += 1
      end
    end
    @wine.sweetness = @sweetness / @counter
    @wine.acidity = (@acidity.to_f / @counter * 3 / 5).round
    @wine.tannins = (@tannins.to_f / @counter * 3 / 5).round
    @wine.body = (@body.to_f / @counter * 3 / 5).round
    @wine.length = (@length.to_f / @counter * 3 / 5).round
    @wine.tasting_color = @wine.tastings.last.color
    @wine.save
    redirect_to wine_path(@wine)
  end

  private
  def tasting_params
    params.require(:tasting).permit(:id, :wine_id, :tasting_date, :taster_name, :color, :sweetness, :acidity, :tannins, :alcohol, :body, :length, :_destroy, tasting_aromas_attributes: [:id, :aroma_id, :tasting_id, :_destroy])
  end
end
