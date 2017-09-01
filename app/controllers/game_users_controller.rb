class GameUsersController < ApplicationController
  layout "game", except: [:index]
  skip_after_action :verify_authorized, only: :create
  skip_after_action :verify_authorized, only: :update

  def index
    @game_users = policy_scope(GameUser)
    redirect_to wine_path(params[:wine_id])
  end

  def create
    @games = Game.all
    @wine = params[:wine_id]
    @game_user = GameUser.new(game_user_params)
    @game_user.user = current_user
    @game_user.save
    @suspects = Suspect.all.sample(3)
    @suspect1 = @suspects.sample
    @positions = [1, 2, 3]
    @random_position1 = @positions.sample
    @guilty_tastings = Tasting.where(wine: @wine)
    @guilty_wine_tasting_aromas = []
    @guilty_aromas = []
    @aromas = Aroma.all
    # Allocate the "wine of the game" to a first suspect
    # 1.1 get all instances of tasting_aromas
    @guilty_tastings.each do |tasting|
      @guilty_wine_tasting_aromas += tasting.tasting_aromas
    end
    # 1.2 get all instances of aroma
    @guilty_wine_tasting_aromas.each do |aroma|
      @guilty_aromas << Aroma.find(aroma.aroma_id)
      @aromas -= @guilty_aromas
    end
    @good_aroma = @guilty_aromas.sample
    GameSuspect.create!(suspect_id: @suspect1.id, wine_id: @wine, game_user_id: @game_user.id, position: @random_position1, aroma_id: @good_aroma.id)
    @suspects -= [@suspect1]
    @positions -= [@random_position1]
    if @game_user.game.game_category_id == 3
      @progame = Game.where(wine_id: @wine).where(game_category_id: GameCategory.find_by(category: "Enquête pro").id).ids.first
      @wines = []
      @wine_suspects = params[:game_user][:game_suspects_attributes].to_a
      @wine_suspects.each do |wine_suspect|
        @wines << Wine.find(wine_suspect[1][:wine].split(" - ").first.to_i)

      end
      set_suspects
    elsif @game_user.game.game_category_id == 1
      # Allocate a wine to suspect that will be different enough to ease the game
      # Select all wines with same color and different acidity as the "wine of the game"
      @wines = Wine.where(color: Wine.find(@wine.to_i).color.capitalize).where.not(acidity: Wine.find(@wine.to_i).acidity)
      @casegame = Game.where(wine_id: @wine.to_i).where(game_category_id: GameCategory.find_by(category: "Case").id).ids.first
      # Allocate other wines to rest of suspects
      set_suspects
      # Create a new GameUserSession
      @game_user_session = GameUserSession.new(user: current_user, game_user: @game_user, session_profile: "leader")
      @game_user_session.save
    else
    end
    #Create a questionnaire
    set_questionnaire
    # Redirection
    if params[:commit] == "Nouvelle partie avec mes amis!" && @game_user.save
      redirect_to set_game_wine_game_user_game_user_session_path(@wine, @game_user, @game_user_session)
    elsif params[:commit] == "J'enquête en solo!" && @game_user.save
      redirect_to intro_recruitment_wine_game_user_game_user_session_path(@wine, @game_user, @game_user_session)
    else
      flash[:error] = "Impossible de démarrer le jeu"
      if params[:commit] == "Valider le jeu"
        redirect_to progame_in_progress_path
      else
      redirect_to wine_path(@wine)
      end
    end
  end

  def update
    if params[:game_user].update(game_user_params)
      @game_user = GameUser.find(params[:id])
      @game_user.update(game_user_params)
      @game_user.save
      redirect_to wine_game_users_path
    else
      render :edit
    end
  end

  private

  def game_user_params
    params.require(:game_user).permit(:game_id, :password, :company_name, :photo)
  end

  def user_answer_params
    params.require(:user_answer).permit(:question_game_id, :answer_game_id, :game_user)
  end

  def set_suspects
    @suspects.each do |suspect|
      @suspect_aromas = []
      @wine_suspect = @wines.sample
      @wine_suspect_tastings = @wine_suspect.tastings
      @wine_suspect_tasting_aromas = []
      @wine_suspect_tastings.each do |tasting|
        @wine_suspect_tasting_aromas += tasting.tasting_aromas if @wine_suspect_tasting_aromas - tasting.tasting_aromas == @wine_suspect_tasting_aromas
      end
      @wine_suspect_tasting_aromas -= @guilty_wine_tasting_aromas
      @wine_suspect_tasting_aromas.each do |aroma|
        @suspect_aromas << Aroma.find(aroma.aroma_id)
        @aromas -= @suspect_aromas
      end
      @suspect_aromas -= @guilty_aromas
      if @suspect_aromas != []
        @suspect_aroma = @suspect_aromas.sample
      else
        @suspect_aroma = @aromas.sample
        @aromas -= [@suspect_aroma]
      end
      @random_position = @positions.sample
      GameSuspect.create!(suspect_id: suspect.id, wine_id: @wine_suspect.id, game_user_id: @game_user.id, position: @random_position, aroma_id: @suspect_aroma.id)
      @wines -= [@wine_suspect]
      @positions -= [@random_position.to_i]
    end
  end

  def set_questionnaire
    @last_aroma = @aromas.sample
    @recruitment_questions = Question.where(typ: "recruitment_qcm").sample(10)
    @recruitment_questions.each do |recruitment_question|
      @question_game = QuestionGame.create!(game_user_id: @game_user.id, question_id: recruitment_question.id)
      @good_answer = Answer.where(question_id: recruitment_question.id).where(good_answer: true).sample
      AnswerGame.create!(question_game_id: @question_game.id, answer_id: @good_answer.id, good_answer: true)
      @answers = Answer.where(question_id: recruitment_question.id).where(good_answer: false).sample(3)
      @answers.each do |answer|
        AnswerGame.create!(question_game_id: @question_game.id, answer_id: answer.id, good_answer: false)
      end
    end
    @questionnaire_wines = []
    if @game_user.game.game_category_id == 3
      @game_suspects = GameSuspect.where(game_user: @game_user).sort_by{|e| e[:position]}
      @game_suspects.each do |suspect|
        @questionnaire_wines << suspect.wine_id
      end
    elsif @game_user.game.game_category_id == 1
      @questionnaire_wines << @wine.to_i
    else
    end
    @questionnaire_wines.each do |wine|
      @questions = Question.where(wine_color: Wine.find(wine).color.capitalize).where.not(typ: "suspect")
      @questions.each do |question|
        @question_game = QuestionGame.create!(game_user_id: @game_user.id, question_id: question.id, wine_id: wine)
        if question.theme == "Regardez dans votre verre"
          @answers = Answer.where(question_id: question.id).sample(4)
          if Answer.where(value: Wine.find(wine).tasting_color).first.nil?
            @good_answer = Answer.create!(value: Wine.find(wine).tasting_color, question_id: question.id, wine_color: Wine.find(wine.to_i).color.capitalize)
            if @answers.include?(@good_answer)
              @answers -= [@good_answer]
              AnswerGame.create!(question_game_id: @question_game.id, answer_id: @good_answer.id, good_answer: true, wine_id: wine)
            else
              @answers = @answers.sample(3)
              AnswerGame.create!(question_game_id: @question_game.id, answer_id: @good_answer.id, good_answer: true, wine_id: wine)
            end
            @answers.each do |answer|
              AnswerGame.create!(question_game_id: @question_game.id, answer_id: answer.id, good_answer: false, wine_id: wine)
            end
          else
            @good_answer = Answer.where(value: Wine.find(wine).tasting_color).first
            if @answers.include?(@good_answer)
              @answers -= [@good_answer]
              AnswerGame.create!(question_game_id: @question_game.id, answer_id: @good_answer.id, good_answer: true, wine_id: wine)
            else
              @answers = @answers.sample(3)
              AnswerGame.create!(question_game_id: @question_game.id, answer_id: @good_answer.id, good_answer: true, wine_id: wine)
            end
            @answers.each do |answer|
              AnswerGame.create!(question_game_id: @question_game.id, answer_id: answer.id, good_answer: false, wine_id: wine)
            end
            @answer_games = AnswerGame.where(question_game_id: @question_game.id)
          end
        elsif question.theme == "Sentez maintenant!"
          @answers = []
          @good_answers = []
          # 1 select aromas for the guilty wine
          @good_aroma = Aroma.find(GameSuspect.where(game_user_id: @game_user.id).where(wine_id: wine).first.aroma_id)
          @good_answer = Answer.where(wine_color: Wine.find(wine).color).where(value: @good_aroma.name)
          AnswerGame.create!(question_game_id: @question_game.id, answer_id: @good_answer.first.id, good_answer: true)
          @suspects = GameSuspect.where(game_user_id: @game_user.id).where.not(wine_id: wine)
          @suspects.each do |suspect|
            @suspect_aroma = Aroma.find(suspect.aroma_id)
            @answer = Answer.where(wine_color: Wine.find(wine).color).where(value: @suspect_aroma.name)
            AnswerGame.create!(question_game_id: @question_game.id, answer_id: @answer.first.id, good_answer: false )
          end
          @last_answer = Answer.where(wine_color: Wine.find(wine).color).where(value: @last_aroma.name)
          AnswerGame.create!(question_game_id: @question_game.id, answer_id: @last_answer.first.id, good_answer: false )
        else
          @answers = Answer.where(question_id: question.id)
          @answers.each do |answer|
            AnswerGame.create!(question_game_id: @question_game.id, answer_id: answer.id, good_answer: false )
          end
          case question.theme
          when "Goutez maintenant! la douceur"
            @good_answer = question.answers.where(value: Wine.find(wine).sweetness).first
            @good_answer_game = AnswerGame.where(question_game_id: @question_game.id).where(answer_id: @good_answer.id).first
            @good_answer_game.good_answer = true
            @good_answer_game.save
          when "Goutez! l'acidité"
            @good_answer = question.answers.where(value: Wine.find(wine).acidity).first
            @good_answer_game = AnswerGame.where(question_game_id: @question_game.id).where(answer_id: @good_answer.id).first
            @good_answer_game.good_answer = true
            @good_answer_game.save
          when "Goutez! l'alcool"
            @good_answer = question.answers.where(value: Wine.find(wine).alcohol).first
            @good_answer_game = AnswerGame.where(question_game_id: @question_game.id).where(answer_id: @good_answer.id).first
            @good_answer_game.good_answer = true
            @good_answer_game.save
          when "Goutez! le corps"
            @good_answer = question.answers.where(value: Wine.find(wine).body).first
            @good_answer_game = AnswerGame.where(question_game_id: @question_game.id).where(answer_id: @good_answer.id).first
            @good_answer_game.good_answer = true
            @good_answer_game.save
          when "Goutez! la longueur"
            @good_answer = question.answers.where(value: Wine.find(wine).length).first
            @good_answer_game = AnswerGame.where(question_game_id: @question_game.id).where(answer_id: @good_answer.id).first
            @good_answer_game.good_answer = true
            @good_answer_game.save
          when "Goutez! les tannins"
            @good_answer = question.answers.where(value: Wine.find(wine).tannins).first
            @good_answer_game = AnswerGame.where(question_game_id: @question_game.id).where(answer_id: @good_answer.id).first
            @good_answer_game.good_answer = true
            @good_answer_game.save
          end
        end
      end
      @questions = Question.where(wine_color: Wine.find(@wine).color.capitalize).where(typ: "suspect")
      @questions.each do |question|
        @question_game = QuestionGame.create!(game_user_id: @game_user.id, question_id: question.id, wine_id: wine)
        @answers = Answer.where(question_id: question.id)
        @answers.each do |answer|
          AnswerGame.create!(question_game_id: @question_game.id, answer_id: answer.id, good_answer: false )
        end
      end
    end
    if @game_user.game.game_category_id == 3
    @questions = Question.where(wine_color: Wine.find(@wine).color.capitalize).where(typ: "suspect")
      @questions.each do |question|
        @question_game = QuestionGame.create!(game_user_id: @game_user.id, question_id: question.id, wine_id: @wine)
        @answers = Answer.where(question_id: question.id)
        @answers.each do |answer|
          AnswerGame.create!(question_game_id: @question_game.id, answer_id: answer.id, good_answer: false )
        end
      end
    end
  end
end
