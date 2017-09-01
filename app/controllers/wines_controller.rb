class WinesController < ApplicationController
  layout "application"
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_authorized, only: [:game_pro_version]
  # skip_after_action :verify_authorized, only: [:create]
  # skip_after_action :verify_authorized, only: [:edit]
  # skip_after_action :verify_authorized, only: [:update]
  # skip_after_action :verify_authorized, only: [:destroy]

  def index
    if params[:query_search] == "true"
      @wines = policy_scope(Wine).search_by_wine_description(params[:query])
      @wines = @wines.blank? ? policy_scope(Wine).all : @wines
      @query = params[:query]
    else
      @wines = policy_scope(Wine).all
      @query = "no_search"
    end
  end

  def show
    @wine = Wine.find(params[:id])
    @game_user = GameUser.new
    @game_user_session = GameUserSession.new(game_user_id: @game_user.id)
    @my_tastings = []
    if current_user
      @my_tastings = @wine.tastings.where(taster_name: current_user.first_name)
    end
    @my_gips = []
    @gips = []
    @my_finished_gips = []
    # Game In Progress where i'm leader
    @my_hosting_gips = GameUser.where(game: Game.where(wine: @wine)).where(finished: false).where(user: current_user)
    @my_hosting_gips.each do |gip|
      @game_user_sessions = GameUserSession.where(game_user: gip).where(user: current_user).where(finished: false)
      @game_user_sessions.each do |game_user_session|
        @my_gips << gip
      end
    end
    # all Game In Progress
    @all_gips = GameUser.where(game: Game.where(wine: @wine)).where(finished: false).where.not(password: nil).where.not(user: current_user)
    @all_gips.each do |all_gip|
      @game_user_sessions = GameUserSession.where(game_user: all_gip).where(finished: false)
      @game_user_sessions.each do |game_user_session|
        @gips << all_gip
      end

      @my_game_user_sessions = GameUserSession.where(game_user: all_gip).where(user: current_user).where(finished: false)
      @my_game_user_sessions.each do |my_game_user_session|
        if my_game_user_session.user == current_user && all_gip.password == my_game_user_session.session_password
          @my_gips << all_gip
        end
      end
      @my_finished_games = GameUserSession.where(game_user: all_gip).where(user: current_user).where(finished: true)
      @my_finished_games.each do |my_finished_game|
        if my_finished_game.game_user_id == all_gip.id
          @my_finished_gips << all_gip
        end
      end
    end
    @my_gips = @my_gips.sort_by{|e| GameUserSession.where(game_user: e).where(user: current_user).first[:created_at]}.reverse
    @gips -= @my_gips
    @gips -= @my_finished_gips
    @gips = @gips.reverse
    authorize @wine
  end

  def new
    @wine = Wine.new
    @tasting = @wine.tastings.build
    @tasting.tasting_aromas.build
    @submit_label = "Ajouter mon vin"
    authorize @wine
  end

  def create
    @wine = Wine.new(wine_params)
    @wine.save
    if @wine.alcohol_percentage < 13
      @wine.alcohol = 1
    elsif @wine.alcohol_percentage < 14.5
      @wine.alcohol = 2
    else
      @wine.alcohol = 3
    end
    @wine.sweetness = @wine.tastings.first.sweetness
    @wine.acidity = (@wine.tastings.first.acidity.to_f * 3 / 5).round
    @wine.tannins = (@wine.tastings.first.tannins.to_f * 3 / 5).round
    @wine.body = (@wine.tastings.first.body.to_f * 3 / 5).round
    @wine.length = (@wine.tastings.first.length.to_f * 3 / 5).round
    @wine.tasting_color = @wine.tastings.first.color
    @wine.save
    @casegame = Game.create!(wine_id: @wine.id, game_category_id: GameCategory.find_by(category: "Case").id)
    @progame = Game.create!(wine_id: @wine.id, game_category_id: GameCategory.find_by(category: "Enquête pro").id)
    redirect_to wines_path
    authorize @wine
  end

  def edit
    @wine = Wine.find(params[:id])
    @submit_label = "Modifier mon vin"
    authorize @wine
  end

  def update
    @wine = Wine.find(params[:id])
    @wine.update(wine_params)
    @wine.country = ISO3166::Country[@wine.country].data["translations"]["fr"]
    @wine.save
    redirect_to wine_path(@wine)
    authorize @wine
  end

  def destroy
    @wine = Wine.find(params[:id])
    @wine.destroy
    redirect_to wines_path
    authorize @wine
  end

  def game_pro_version
    @wine = Wine.find(params[:wine_id])
    # @game_user = GameUser.create!(user: current_user, game: @progame)
    @submit_label = "Valider le jeu"
    @wines = Wine.where(color: @wine.color).order("id ASC").pluck(:id, :estate, :label, :vintage)
    @wines_for_select = []
    @wines.each do |wine|
      @wines_for_select << wine.join(" - ")
    end
  end

  private
  def wine_params
    params.require(:wine).permit(:estate, :cuvee, :label, :region, :country, :vintage, :grape_varieties, :color, :volume, :alcohol_percentage, :photo, tastings_attributes: [ :id, :wine_id, :tasting_date, :taster_name, :color, :sweetness, :acidity, :tannins, :alcohol, :body, :length, :_destroy, tasting_aromas_attributes: [:id, :aroma_id, :tasting_id, :_destroy]])
  end
end
