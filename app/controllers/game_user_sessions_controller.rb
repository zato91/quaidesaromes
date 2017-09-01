class GameUserSessionsController < ApplicationController
  layout "game", except: [:index, :set_game, :create, :edit_pro]
  skip_after_action :verify_authorized, only: :set_game
  skip_after_action :verify_authorized, only: :create
  skip_after_action :verify_authorized, only: :play
  skip_after_action :verify_authorized, only: :recruitment_play
  skip_after_action :verify_authorized, only: :create_answer
  skip_after_action :verify_authorized, only: :provisional_ranking
  skip_after_action :verify_authorized, only: :user_rating
  skip_after_action :verify_authorized, only: :create_rating
  skip_after_action :verify_authorized, only: :suspect_choice
  skip_after_action :verify_authorized, only: :pro_suspect_choice
  skip_after_action :verify_authorized, only: :pro_suspect
  skip_after_action :verify_authorized, only: :endgame
  skip_after_action :verify_authorized, only: :edit_pro
  skip_after_action :verify_authorized, only: :update_pro

  def index
    @game_user_sessions = policy_scope(GameUserSession)
    @game_user_sessions = @game_user_sessions.sort {|a, b| b[:updated_at] <=> a[:updated_at]}
  end

  def create
    @wine = Wine.find(params[:wine_id])
    @game_user = GameUser.find(params[:game_user_id])
    if @game_user.game.game_category.id == 1
      if params[:game_user_session][:session_password] == GameUser.find(params[:game_user_id]).password
        @game_user_session = GameUserSession.new(user: current_user, game_user: @game_user, session_profile: "player", session_password: params[:game_user_session][:session_password])
        @game_user_session.save
        redirect_to intro_recruitment_wine_game_user_game_user_session_path(@wine, @game_user, @game_user_session)
      else
        redirect_to wine_path(@wine)
      end
    elsif @game_user.game.game_category.id == 3
      @game_user_session = GameUserSession.new(user: current_user, game_user: @game_user, session_profile: "player")
      @game_user_session.save
      # redirect_to intro_recruitment_wine_game_user_game_user_session_path(@wine, @game_user, @game_user_session)
      redirect_to edit_pro_wine_game_user_game_user_session_path(@wine, @game_user, @game_user_session)
    end
  end

  def edit_pro
    @wine = Wine.find(params[:wine_id])
    @game_user = GameUser.find(params[:game_user_id])
    @game_user_session = GameUserSession.find(params[:id])
    @submit_label = "MON EQUIPE EST DANS LA PLACE !!"
  end

  def update_pro
    @wine = Wine.find(params[:wine_id])
    @game_user = GameUser.find(params[:game_user_id])
    @game_user_session = GameUserSession.find(params[:id])
    @game_user_session.update(game_user_session_params)
    redirect_to intro_recruitment_wine_game_user_game_user_session_path(@wine, @game_user, @game_user_session)
  end

  def set_game
    @game_user = GameUser.find(params[:game_user_id])
    @game_user_session = GameUserSession.find(params[:id])
    @wine = @game_user.wine
    @game_user.password = params[:password]
    @game_user.save
  end

  def intro_recruitment
    @game_user = GameUser.find(params[:game_user_id])
    @game_user_session = GameUserSession.find(params[:id])
    authorize(@game_user)
  end

  def intro
    @game_user = GameUser.find(params[:game_user_id])
    @game_user_session = GameUserSession.find(params[:id])
    @game_suspects = @game_user.game_suspects
    @game_suspect_1 = @game_suspects.where(position: 1).first
    @suspect_1 = Suspect.find(@game_suspect_1.suspect)
    @game_suspect_2 = @game_suspects.where(position: 2).first
    @suspect_2 = Suspect.find(@game_suspect_2.suspect)
    @game_suspect_3 = @game_suspects.where(position: 3).first
    @suspect_3 = Suspect.find(@game_suspect_3.suspect)
    authorize(@game_user)
  end

  def recruitment_play
    @game_user = GameUser.find(params[:game_user_id])
    @game_user_session = GameUserSession.find(params[:id])
    @game = @game_user.game
    @question_game = QuestionGame.where(game_user: @game_user).find_by_position(params[:question_position].to_i + 1)
    @question = @question_game.question
    @answer_games = AnswerGame.where(question_game_id: @question_game.id).shuffle
    @user_answer = UserAnswer.new
    @game_category = @game.game_category.id
    @players = GameUserSession.where(game_user: @game_user).count
    if params[:question_position].to_i == 10
      redirect_to provisional_ranking_wine_game_user_game_user_session_path(params[:wine_id], @game_user, @game_user_session)
    end
  end

  def play
    @game_user = GameUser.find(params[:game_user_id])
    @game_user_session = GameUserSession.find(params[:id])
    @game = @game_user.game
    @last_question = QuestionGame.where(game_user: @game_user).find_by_position(params[:question_position].to_i)
    @question_game = QuestionGame.where(game_user: @game_user).find_by_position(params[:question_position].to_i + 1)
    @question = @question_game.question
    @answer_games = AnswerGame.where(question_game_id: @question_game.id)
    if @game.game_category.id == 3
      if @last_question.position == 17 || @last_question.position == 25 || @last_question.position == 33
        redirect_to pro_suspect_wine_game_user_game_user_session_path(params[:wine_id],@game_user, @game_user_session, question_position: @last_question.position)
      elsif @question_game.last?
        redirect_to pro_suspect_choice_wine_game_user_game_user_session_path(params[:wine_id],@game_user, @game_user_session)
      else
      end
    elsif @game.game_category.id == 1
      if @question_game.last?
        redirect_to user_rating_wine_game_user_game_user_session_path(params[:wine_id],@game_user, @game_user_session)
      else
        if @question_game.position <= 12
          @answer_games = @answer_games.shuffle
        else
          @answer_games = @answer_games.order(:id).reverse
        end
      end
    end

  end

  def create_answer
    @game_user = GameUser.find(params[:game_user_id])
    @game_user_session = GameUserSession.find(params[:id])
    @question = QuestionGame.find(params[:user_answer][:question_game_id])
    @answer = AnswerGame.find(params[:user_answer][:answer_game])
    @user_answer = @game_user_session.user_answers.where(question_game_id: @question.id).first_or_initialize
    @user_answer.answer_game_id = @answer.id
    @user_answer.joker_user = params[:user_answer][:joker_user]
    if @user_answer.save
      if @question.question.typ == "recruitment_qcm"
        redirect_to recruitment_play_wine_game_user_game_user_session_path(@game_user.wine, @game_user, @game_user_session, question_position: params[:question_position])
      else
        redirect_to play_wine_game_user_game_user_session_path(@game_user.wine, @game_user, @game_user_session, question_position: params[:question_position])
      end
    else
      render :play
    end
  end

  def provisional_ranking
    @game_user_session =  GameUserSession.find(params[:id])
    @game_user = GameUser.find(params[:game_user_id])
    @game =  @game_user.game
    @user_answers = @game_user_session.user_answers
    @score = 0
    @user_answers.each do | user_answer |
      if user_answer.answer_game.good_answer && user_answer.joker_user == false
        @score += 100
      elsif user_answer.answer_game.good_answer && user_answer.joker_user == true
        @score += 50
      end
    end
    @game_user_session.provisional_score = @score
    @game_user_session.save
    @players = GameUserSession.where(game_user_id: @game_user)
    @players = @players.sort {|a, b| b[:provisional_score] <=> a[:provisional_score]}
  end

  def user_rating
    @game_user = GameUser.find(params[:game_user_id])
    @game_user_session =  GameUserSession.find(params[:id])
    @user = current_user
  end

  def create_rating
    @game_user_session = GameUserSession.find(params[:id])
    @game_user_session.rating = params[:game_user_session][:rating].to_f
    @game_user_session.save

    if @game_user_session.save
      redirect_to suspect_choice_wine_game_user_game_user_session_path(params[:wine_id],params[:game_user_id], @game_user_session)
    end
  end

  def pro_suspect
    @game_user = GameUser.find(params[:game_user_id])
    @game_user_session =  GameUserSession.find(params[:id])
    # @last_question = QuestionGame.where(game_user: @game_user).find_by_position(params[:question_position].to_i)
    @question_game = QuestionGame.where(game_user: @game_user).find_by_position(params[:question_position].to_i)
    @question = @question_game.question
    @user = current_user
    @game = @game_user.game
    @game_guilty = @game_user_session.game_user.game_suspects.where(wine: @game_user_session.game_user.game.wine).first
    @suspect = @game_user.game_suspects.where(wine: @question_game.wine_id).first

    @tasting_color_question_id = Question.where(theme: "Regardez dans votre verre").where(wine_color: @question_game.wine.color.capitalize).ids.first
    @tasting_color_question_game_id = @game_user.question_games.where(question_id: @tasting_color_question_id).where(wine_id: @question_game.wine_id).ids.first
    @tasting_color_answer_game_id = @game_user_session.user_answers.where(question_game_id: @tasting_color_question_game_id).last.answer_game_id
    @tasting_color_answer_id = AnswerGame.find(@tasting_color_answer_game_id).answer_id
    @tasting_color = Answer.find(@tasting_color_answer_id).value
    @aromas_family_question_id = Question.where(theme: "Sentez maintenant!").where(wine_color: @question_game.wine.color.capitalize).ids.first
    @aromas_family_question_game_id = @game_user.question_games.where(question_id: @aromas_family_question_id).where(wine_id: @question_game.wine_id).ids.first
    @aromas_family_answer_game_id = @game_user_session.user_answers.where(question_game_id: @aromas_family_question_game_id).last.answer_game_id
    @aromas_family_answer_id = AnswerGame.find(@aromas_family_answer_game_id).answer_id
    @aromas_family = Answer.find(@aromas_family_answer_id).value

    @sweetness_question_id = Question.where(theme: "Goutez maintenant! la douceur").where(wine_color: @question_game.wine.color.capitalize).ids.first
    @sweetness_question_game_id = @game_user.question_games.where(question_id: @sweetness_question_id).where(wine_id: @question_game.wine_id).ids.first
    @sweetness_answer_game_id = @game_user_session.user_answers.where(question_game_id: @sweetness_question_game_id).last.answer_game_id
    @sweetness_answer_id = AnswerGame.find(@sweetness_answer_game_id).answer_id
    @sweetness = Answer.find(@sweetness_answer_id).value

    @acidity_question_id = Question.where(theme: "Goutez! l'acidité").where(wine_color: @question_game.wine.color.capitalize).ids.first
    @acidity_question_game_id = @game_user.question_games.where(question_id: @acidity_question_id).where(wine_id: @question_game.wine_id).ids.first
    @acidity_answer_game_id = @game_user_session.user_answers.where(question_game_id: @acidity_question_game_id).last.answer_game_id
    @acidity_answer_id = AnswerGame.find(@acidity_answer_game_id).answer_id
    @acidity = Answer.find(@acidity_answer_id).value

    @alcohol_question_id = Question.where(theme: "Goutez! l'alcool").where(wine_color: @question_game.wine.color.capitalize).ids.first
    @alcohol_question_game_id = @game_user.question_games.where(question_id: @alcohol_question_id).where(wine_id: @question_game.wine_id).ids.first
    @alcohol_answer_game_id = @game_user_session.user_answers.where(question_game_id: @alcohol_question_game_id).last.answer_game_id
    @alcohol_answer_id = AnswerGame.find(@alcohol_answer_game_id).answer_id
    @alcohol = Answer.find(@alcohol_answer_id).value

    @body_question_id = Question.where(theme: "Goutez! le corps").where(wine_color: @question_game.wine.color.capitalize).ids.first
    @body_question_game_id = @game_user.question_games.where(question_id: @body_question_id).where(wine_id: @question_game.wine_id).ids.first
    @body_answer_game_id = @game_user_session.user_answers.where(question_game_id: @body_question_game_id).last.answer_game_id
    @body_answer_id = AnswerGame.find(@body_answer_game_id).answer_id
    @body = Answer.find(@body_answer_id).value
    @sweetness_guilty = @game_guilty.wine.sweetness
    @acidity_guilty = @game_guilty.wine.acidity
    @alcohol_guilty = @game_guilty.wine.alcohol
    @body_guilty = @game_guilty.wine.body
    @length_guilty = @game_guilty.wine.length
    @tannins_guilty = @game_guilty.wine.tannins

    @label = []
    if @game_user.game.wine.color.capitalize == "Blanc"
      @label_4 = "Corps"
      @label_5 = "Longueur"
      @length_question_id = Question.where(theme: "Goutez! la longueur").where(wine_color: @question_game.wine.color.capitalize).ids.first
      @length_question_game_id = @game_user.question_games.where(question_id: @length_question_id).where(wine_id: @question_game.wine_id).ids.first
      @length_answer_game_id = @game_user_session.user_answers.where(question_game_id: @length_question_game_id).last.answer_game_id
      @length_answer_id = AnswerGame.find(@length_answer_game_id).answer_id
      @length = Answer.find(@length_answer_id).value
      @data_4 = @body
      @data_5 = @length
      @data_4_guilty = @body_guilty
      @data_5_guilty = @length_guilty
    else
      @label_4 = "Tannins"
      @label_5 = "Corps"
      @tannins_question_id = Question.where(theme: "Goutez! les tannins").where(wine_color: @question_game.wine.color.capitalize).ids.first
      @tannins_question_game_id = @game_user.question_games.where(question_id: @tannins_question_id).where(wine_id: @question_game.wine_id).ids.first
      @tannins_answer_game_id = @game_user_session.user_answers.where(question_game_id: @tannins_question_game_id).last.answer_game_id
      @tannins_answer_id = AnswerGame.find(@tannins_answer_game_id).answer_id
      @tannins = Answer.find(@tannins_answer_id).value
      @data_4 = @tannins
      @data_5 = @body
      @data_4_guilty = @tannins_guilty
      @data_5_guilty = @body_guilty
    end
  end

  def suspect_choice
    @game_user = GameUser.find(params[:game_user_id])
    @game_user_session =  GameUserSession.find(params[:id])
    @user = current_user
    @game = @game_user.game
    @game_suspects = []
    @game_suspect_1 = @game_user_session.game_user.game_suspects.where(position: 1).first
    @game_suspects << @game_suspect_1
    @game_suspect_2 = @game_user_session.game_user.game_suspects.where(position: 2).first
    @game_suspects << @game_suspect_2
    @game_suspect_3 = @game_user_session.game_user.game_suspects.where(position: 3).first
    @game_suspects << @game_suspect_3

    @tasting_color_question_id = Question.where(theme: "Regardez dans votre verre").where(wine_color: @game_user.game.wine.color.capitalize).ids.first
    @tasting_color_question_game_id = @game_user.question_games.where(question_id: @tasting_color_question_id).ids.first
    @tasting_color_answer_game_id = @game_user_session.user_answers.where(question_game_id: @tasting_color_question_game_id).last.answer_game_id
    @tasting_color_answer_id = AnswerGame.find(@tasting_color_answer_game_id).answer_id
    @tasting_color = Answer.find(@tasting_color_answer_id).value
    @aromas_family_question_id = Question.where(theme: "Sentez maintenant!").where(wine_color: @game_user.game.wine.color.capitalize).ids.first
    @aromas_family_question_game_id = @game_user.question_games.where(question_id: @aromas_family_question_id).ids.first
    @aromas_family_answer_game_id = @game_user_session.user_answers.where(question_game_id: @aromas_family_question_game_id).last.answer_game_id
    @aromas_family_answer_id = AnswerGame.find(@aromas_family_answer_game_id).answer_id
    @aromas_family = Answer.find(@aromas_family_answer_id).value

    @sweetness_question_id = Question.where(theme: "Goutez maintenant! la douceur").where(wine_color: @game_user.game.wine.color.capitalize).ids.first
    @sweetness_question_game_id = @game_user.question_games.where(question_id: @sweetness_question_id).ids.first
    @sweetness_answer_game_id = @game_user_session.user_answers.where(question_game_id: @sweetness_question_game_id).last.answer_game_id
    @sweetness_answer_id = AnswerGame.find(@sweetness_answer_game_id).answer_id
    @sweetness = Answer.find(@sweetness_answer_id).value

    @acidity_question_id = Question.where(theme: "Goutez! l'acidité").where(wine_color: @game_user.game.wine.color.capitalize).ids.first
    @acidity_question_game_id = @game_user.question_games.where(question_id: @acidity_question_id).ids.first
    @acidity_answer_game_id = @game_user_session.user_answers.where(question_game_id: @acidity_question_game_id).last.answer_game_id
    @acidity_answer_id = AnswerGame.find(@acidity_answer_game_id).answer_id
    @acidity = Answer.find(@acidity_answer_id).value

    @alcohol_question_id = Question.where(theme: "Goutez! l'alcool").where(wine_color: @game_user.game.wine.color.capitalize).ids.first
    @alcohol_question_game_id = @game_user.question_games.where(question_id: @alcohol_question_id).ids.first
    @alcohol_answer_game_id = @game_user_session.user_answers.where(question_game_id: @alcohol_question_game_id).last.answer_game_id
    @alcohol_answer_id = AnswerGame.find(@alcohol_answer_game_id).answer_id
    @alcohol = Answer.find(@alcohol_answer_id).value

    @body_question_id = Question.where(theme: "Goutez! le corps").where(wine_color: @game_user.game.wine.color.capitalize).ids.first
    @body_question_game_id = @game_user.question_games.where(question_id: @body_question_id).ids.first
    @body_answer_game_id = @game_user_session.user_answers.where(question_game_id: @body_question_game_id).last.answer_game_id
    @body_answer_id = AnswerGame.find(@body_answer_game_id).answer_id
    @body = Answer.find(@body_answer_id).value

    @sweetness_suspect_1 = @game_suspect_1.wine.sweetness
    @acidity_suspect_1 = @game_suspect_1.wine.acidity
    @alcohol_suspect_1 = @game_suspect_1.wine.alcohol
    @body_suspect_1 = @game_suspect_1.wine.body
    @length_suspect_1 = @game_suspect_1.wine.length
    @tannins_suspect_1 = @game_suspect_1.wine.tannins
    @sweetness_suspect_2 = @game_suspect_2.wine.sweetness
    @acidity_suspect_2 = @game_suspect_2.wine.acidity
    @alcohol_suspect_2 = @game_suspect_2.wine.alcohol
    @body_suspect_2 = @game_suspect_2.wine.body
    @length_suspect_2 = @game_suspect_2.wine.length
    @tannins_suspect_2 = @game_suspect_2.wine.tannins
    @sweetness_suspect_3 = @game_suspect_3.wine.sweetness
    @acidity_suspect_3 = @game_suspect_3.wine.acidity
    @alcohol_suspect_3 = @game_suspect_3.wine.alcohol
    @body_suspect_3 = @game_suspect_3.wine.body
    @length_suspect_3 = @game_suspect_3.wine.length
    @tannins_suspect_3 = @game_suspect_3.wine.tannins

    @label = []
    if @game_user.game.wine.color.capitalize == "Blanc"
      @label_4 = "Corps"
      @label_5 = "Longueur"
      @length_question_id = Question.where(theme: "Goutez! la longueur").where(wine_color: @game_user.game.wine.color.capitalize).ids.first
      @length_question_game_id = @game_user.question_games.where(question_id: @length_question_id).ids.first
      @length_answer_game_id = @game_user_session.user_answers.where(question_game_id: @length_question_game_id).last.answer_game_id
      @length_answer_id = AnswerGame.find(@length_answer_game_id).answer_id
      @length = Answer.find(@length_answer_id).value
      @data_4 = @body
      @data_5 = @length
      @data_4_suspect_1 = @body_suspect_1
      @data_4_suspect_2 = @body_suspect_2
      @data_4_suspect_3 = @body_suspect_3
      @data_5_suspect_1 = @length_suspect_1
      @data_5_suspect_2 = @length_suspect_2
      @data_5_suspect_3 = @length_suspect_3
    else
      @label_4 = "Tannins"
      @label_5 = "Corps"
      @tannins_question_id = Question.where(theme: "Goutez! les tannins").where(wine_color: @game_user.game.wine.color.capitalize).ids.first
      @tannins_question_game_id = @game_user.question_games.where(question_id: @tannins_question_id).ids.first
      @tannins_answer_game_id = @game_user_session.user_answers.where(question_game_id: @tannins_question_game_id).last.answer_game_id
      @tannins_answer_id = AnswerGame.find(@tannins_answer_game_id).answer_id
      @tannins = Answer.find(@tannins_answer_id).value
      @data_4 = @tannins
      @data_5 = @body
      @data_4_suspect_1 = @tannins_suspect_1
      @data_4_suspect_2 = @tannins_suspect_2
      @data_4_suspect_3 = @tannins_suspect_3
      @data_5_suspect_1 = @body_suspect_1
      @data_5_suspect_2 = @body_suspect_2
      @data_5_suspect_3 = @body_suspect_3
    end
  end

  def pro_suspect_choice
    @game_user = GameUser.find(params[:game_user_id])
    @game_user_session =  GameUserSession.find(params[:id])
    @user = current_user
    @game = @game_user.game
    @game_suspects = []
    @game_suspect_1 = @game_user_session.game_user.game_suspects.where(position: 1).first
    @game_suspects << @game_suspect_1
    @game_suspect_2 = @game_user_session.game_user.game_suspects.where(position: 2).first
    @game_suspects << @game_suspect_2
    @game_suspect_3 = @game_user_session.game_user.game_suspects.where(position: 3).first
    @game_suspects << @game_suspect_3

    @game_guilty = @game_user_session.game_user.game_suspects.where(wine: @game_user_session.game_user.game.wine).first
    @sweetness_guilty = @game_guilty.wine.sweetness
    @acidity_guilty = @game_guilty.wine.acidity
    @alcohol_guilty = @game_guilty.wine.alcohol
    @body_guilty = @game_guilty.wine.body
    @length_guilty = @game_guilty.wine.length
    @tannins_guilty = @game_guilty.wine.tannins

    @tasting_color_question_id = Question.where(theme: "Regardez dans votre verre").where(wine_color: @game_user.game.wine.color.capitalize).ids.first
    @tasting_color_question_game_id_suspect_1 = @game_user.question_games.where(question_id: @tasting_color_question_id).where(wine_id: @game_suspect_1.wine_id).ids.first
    @tasting_color_answer_game_id_suspect_1 = @game_user_session.user_answers.where(question_game_id: @tasting_color_question_game_id_suspect_1).last.answer_game_id
    @tasting_color_answer_id_suspect_1 = AnswerGame.find(@tasting_color_answer_game_id_suspect_1).answer_id
    @tasting_color_suspect_1 = Answer.find(@tasting_color_answer_id_suspect_1).value
    @tasting_color_question_game_id_suspect_2 = @game_user.question_games.where(question_id: @tasting_color_question_id).where(wine_id: @game_suspect_2.wine_id).ids.first
    @tasting_color_answer_game_id_suspect_2 = @game_user_session.user_answers.where(question_game_id: @tasting_color_question_game_id_suspect_2).last.answer_game_id
    @tasting_color_answer_id_suspect_2 = AnswerGame.find(@tasting_color_answer_game_id_suspect_2).answer_id
    @tasting_color_suspect_2 = Answer.find(@tasting_color_answer_id_suspect_2).value
    @tasting_color_question_game_id_suspect_3 = @game_user.question_games.where(question_id: @tasting_color_question_id).where(wine_id: @game_suspect_3.wine_id).ids.first
    @tasting_color_answer_game_id_suspect_3 = @game_user_session.user_answers.where(question_game_id: @tasting_color_question_game_id_suspect_3).last.answer_game_id
    @tasting_color_answer_id_suspect_3 = AnswerGame.find(@tasting_color_answer_game_id_suspect_3).answer_id
    @tasting_color_suspect_3 = Answer.find(@tasting_color_answer_id_suspect_3).value

    @aromas_family_question_id = Question.where(theme: "Sentez maintenant!").where(wine_color: @game_user.wine.color.capitalize).ids.first
    @aromas_family_question_game_id_suspect_1 = @game_user.question_games.where(question_id: @aromas_family_question_id).where(wine_id: @game_suspect_1.wine_id).ids.first
    @aromas_family_answer_game_id_suspect_1 = @game_user_session.user_answers.where(question_game_id: @aromas_family_question_game_id_suspect_1).last.answer_game_id
    @aromas_family_answer_id_suspect_1 = AnswerGame.find(@aromas_family_answer_game_id_suspect_1).answer_id
    @aromas_family_suspect_1 = Answer.find(@aromas_family_answer_id_suspect_1).value
    @aromas_family_question_game_id_suspect_2 = @game_user.question_games.where(question_id: @aromas_family_question_id).where(wine_id: @game_suspect_2.wine_id).ids.first
    @aromas_family_answer_game_id_suspect_2 = @game_user_session.user_answers.where(question_game_id: @aromas_family_question_game_id_suspect_2).last.answer_game_id
    @aromas_family_answer_id_suspect_2 = AnswerGame.find(@aromas_family_answer_game_id_suspect_2).answer_id
    @aromas_family_suspect_2 = Answer.find(@aromas_family_answer_id_suspect_2).value
    @aromas_family_question_game_id_suspect_3 = @game_user.question_games.where(question_id: @aromas_family_question_id).where(wine_id: @game_suspect_3.wine_id).ids.first
    @aromas_family_answer_game_id_suspect_3 = @game_user_session.user_answers.where(question_game_id: @aromas_family_question_game_id_suspect_3).last.answer_game_id
    @aromas_family_answer_id_suspect_3 = AnswerGame.find(@aromas_family_answer_game_id_suspect_3).answer_id
    @aromas_family_suspect_3 = Answer.find(@aromas_family_answer_id_suspect_3).value

    @sweetness_question_id = Question.where(theme: "Goutez maintenant! la douceur").where(wine_color: @game_user.wine.color.capitalize).ids.first
    @sweetness_question_game_id_suspect_1 = @game_user.question_games.where(question_id: @sweetness_question_id).where(wine_id: @game_suspect_1.wine_id).ids.first
    @sweetness_answer_game_id_suspect_1 = @game_user_session.user_answers.where(question_game_id: @sweetness_question_game_id_suspect_1).last.answer_game_id
    @sweetness_answer_id_suspect_1 = AnswerGame.find(@sweetness_answer_game_id_suspect_1).answer_id
    @sweetness_suspect_1 = Answer.find(@sweetness_answer_id_suspect_1).value
    @sweetness_question_game_id_suspect_2 = @game_user.question_games.where(question_id: @sweetness_question_id).where(wine_id: @game_suspect_2.wine_id).ids.first
    @sweetness_answer_game_id_suspect_2 = @game_user_session.user_answers.where(question_game_id: @sweetness_question_game_id_suspect_2).last.answer_game_id
    @sweetness_answer_id_suspect_2 = AnswerGame.find(@sweetness_answer_game_id_suspect_2).answer_id
    @sweetness_suspect_2 = Answer.find(@sweetness_answer_id_suspect_2).value
    @sweetness_question_game_id_suspect_3 = @game_user.question_games.where(question_id: @sweetness_question_id).where(wine_id: @game_suspect_3.wine_id).ids.first
    @sweetness_answer_game_id_suspect_3 = @game_user_session.user_answers.where(question_game_id: @sweetness_question_game_id_suspect_3).last.answer_game_id
    @sweetness_answer_id_suspect_3 = AnswerGame.find(@sweetness_answer_game_id_suspect_3).answer_id
    @sweetness_suspect_3 = Answer.find(@sweetness_answer_id_suspect_3).value

    @acidity_question_id = Question.where(theme: "Goutez! l'acidité").where(wine_color: @game_user.wine.color.capitalize).ids.first
    @acidity_question_game_id_suspect_1 = @game_user.question_games.where(question_id: @acidity_question_id).where(wine_id: @game_suspect_1.wine_id).ids.first
    @acidity_answer_game_id_suspect_1 = @game_user_session.user_answers.where(question_game_id: @acidity_question_game_id_suspect_1).last.answer_game_id
    @acidity_answer_id_suspect_1 = AnswerGame.find(@acidity_answer_game_id_suspect_1).answer_id
    @acidity_suspect_1 = Answer.find(@acidity_answer_id_suspect_1).value
    @acidity_question_game_id_suspect_2 = @game_user.question_games.where(question_id: @acidity_question_id).where(wine_id: @game_suspect_2.wine_id).ids.first
    @acidity_answer_game_id_suspect_2 = @game_user_session.user_answers.where(question_game_id: @acidity_question_game_id_suspect_2).last.answer_game_id
    @acidity_answer_id_suspect_2 = AnswerGame.find(@acidity_answer_game_id_suspect_2).answer_id
    @acidity_suspect_2 = Answer.find(@acidity_answer_id_suspect_2).value
    @acidity_question_game_id_suspect_3 = @game_user.question_games.where(question_id: @acidity_question_id).where(wine_id: @game_suspect_3.wine_id).ids.first
    @acidity_answer_game_id_suspect_3 = @game_user_session.user_answers.where(question_game_id: @acidity_question_game_id_suspect_3).last.answer_game_id
    @acidity_answer_id_suspect_3 = AnswerGame.find(@acidity_answer_game_id_suspect_3).answer_id
    @acidity_suspect_3 = Answer.find(@acidity_answer_id_suspect_3).value

    @alcohol_question_id = Question.where(theme: "Goutez! l'alcool").where(wine_color: @game_user.wine.color.capitalize).ids.first
    @alcohol_question_game_id_suspect_1 = @game_user.question_games.where(question_id: @alcohol_question_id).where(wine_id: @game_suspect_1.wine_id).ids.first
    @alcohol_answer_game_id_suspect_1 = @game_user_session.user_answers.where(question_game_id: @alcohol_question_game_id_suspect_1).last.answer_game_id
    @alcohol_answer_id_suspect_1 = AnswerGame.find(@alcohol_answer_game_id_suspect_1).answer_id
    @alcohol_suspect_1 = Answer.find(@alcohol_answer_id_suspect_1).value
    @alcohol_question_game_id_suspect_2 = @game_user.question_games.where(question_id: @alcohol_question_id).where(wine_id: @game_suspect_2.wine_id).ids.first
    @alcohol_answer_game_id_suspect_2 = @game_user_session.user_answers.where(question_game_id: @alcohol_question_game_id_suspect_2).last.answer_game_id
    @alcohol_answer_id_suspect_2 = AnswerGame.find(@alcohol_answer_game_id_suspect_2).answer_id
    @alcohol_suspect_2 = Answer.find(@alcohol_answer_id_suspect_2).value
    @alcohol_question_game_id_suspect_3 = @game_user.question_games.where(question_id: @alcohol_question_id).where(wine_id: @game_suspect_3.wine_id).ids.first
    @alcohol_answer_game_id_suspect_3 = @game_user_session.user_answers.where(question_game_id: @alcohol_question_game_id_suspect_3).last.answer_game_id
    @alcohol_answer_id_suspect_3 = AnswerGame.find(@alcohol_answer_game_id_suspect_3).answer_id
    @alcohol_suspect_3 = Answer.find(@alcohol_answer_id_suspect_3).value

    @body_question_id = Question.where(theme: "Goutez! le corps").where(wine_color: @game_user.wine.color.capitalize).ids.first
    @body_question_game_id_suspect_1 = @game_user.question_games.where(question_id: @body_question_id).where(wine_id: @game_suspect_1.wine_id).ids.first
    @body_answer_game_id_suspect_1 = @game_user_session.user_answers.where(question_game_id: @body_question_game_id_suspect_1).last.answer_game_id
    @body_answer_id_suspect_1 = AnswerGame.find(@body_answer_game_id_suspect_1).answer_id
    @body_suspect_1 = Answer.find(@body_answer_id_suspect_1).value
    @body_question_game_id_suspect_2 = @game_user.question_games.where(question_id: @body_question_id).where(wine_id: @game_suspect_2.wine_id).ids.first
    @body_answer_game_id_suspect_2 = @game_user_session.user_answers.where(question_game_id: @body_question_game_id_suspect_2).last.answer_game_id
    @body_answer_id_suspect_2 = AnswerGame.find(@body_answer_game_id_suspect_2).answer_id
    @body_suspect_2 = Answer.find(@body_answer_id_suspect_2).value
    @body_question_game_id_suspect_3 = @game_user.question_games.where(question_id: @body_question_id).where(wine_id: @game_suspect_3.wine_id).ids.first
    @body_answer_game_id_suspect_3 = @game_user_session.user_answers.where(question_game_id: @body_question_game_id_suspect_3).last.answer_game_id
    @body_answer_id_suspect_3 = AnswerGame.find(@body_answer_game_id_suspect_3).answer_id
    @body_suspect_3 = Answer.find(@body_answer_id_suspect_3).value

    @label = []
    if @game_user.game.wine.color.capitalize == "Blanc"
      @label_4 = "Corps"
      @label_5 = "Longueur"
      @length_question_id = Question.where(theme: "Goutez! la longueur").where(wine_color: @game_user.game.wine.color.capitalize).ids.first
      @length_question_game_id_suspect_1 = @game_user.question_games.where(question_id: @length_question_id).where(wine_id: @game_suspect_1.wine_id).ids.first
      @length_answer_game_id_suspect_1 = @game_user_session.user_answers.where(question_game_id: @length_question_game_id_suspect_1).last.answer_game_id
      @length_answer_id_suspect_1 = AnswerGame.find(@length_answer_game_id_suspect_1).answer_id
      @length_suspect_1 = Answer.find(@length_answer_id_suspect_1).value
      @length_question_game_id_suspect_2 = @game_user.question_games.where(question_id: @length_question_id).where(wine_id: @game_suspect_2.wine_id).ids.first
      @length_answer_game_id_suspect_2 = @game_user_session.user_answers.where(question_game_id: @length_question_game_id_suspect_2).last.answer_game_id
      @length_answer_id_suspect_2 = AnswerGame.find(@length_answer_game_id_suspect_2).answer_id
      @length_suspect_2 = Answer.find(@length_answer_id_suspect_2).value
      @length_question_game_id_suspect_3 = @game_user.question_games.where(question_id: @length_question_id).where(wine_id: @game_suspect_3.wine_id).ids.first
      @length_answer_game_id_suspect_3 = @game_user_session.user_answers.where(question_game_id: @length_question_game_id_suspect_3).last.answer_game_id
      @length_answer_id_suspect_3 = AnswerGame.find(@length_answer_game_id_suspect_3).answer_id
      @length_suspect_3 = Answer.find(@length_answer_id_suspect_3).value
      @data_4_suspect_1 = @body_suspect_1
      @data_5_suspect_1 = @length_suspect_1
      @data_4_suspect_2 = @body_suspect_2
      @data_5_suspect_2 = @length_suspect_2
      @data_4_suspect_3 = @body_suspect_3
      @data_5_suspect_3 = @length_suspect_3
      @data_4_guilty = @body_guilty
      @data_5_guilty = @length_guilty
    else
      @label_4 = "Tannins"
      @label_5 = "Corps"
      @tannins_question_id = Question.where(theme: "Goutez! les tannins").where(wine_color: @game_user.game.wine.color.capitalize).ids.first
      @tannins_question_game_id_suspect_1 = @game_user.question_games.where(question_id: @tannins_question_id).where(wine_id: @game_suspect_1.wine_id).ids.first
      @tannins_answer_game_id_suspect_1 = @game_user_session.user_answers.where(question_game_id: @tannins_question_game_id_suspect_1).last.answer_game_id
      @tannins_answer_id_suspect_1 = AnswerGame.find(@tannins_answer_game_id_suspect_1).answer_id
      @tannins_suspect_1 = Answer.find(@tannins_answer_id_suspect_1).value
      @tannins_question_game_id_suspect_2 = @game_user.question_games.where(question_id: @tannins_question_id).where(wine_id: @game_suspect_2.wine_id).ids.first
      @tannins_answer_game_id_suspect_2 = @game_user_session.user_answers.where(question_game_id: @tannins_question_game_id_suspect_2).last.answer_game_id
      @tannins_answer_id_suspect_2 = AnswerGame.find(@tannins_answer_game_id_suspect_2).answer_id
      @tannins_suspect_2 = Answer.find(@tannins_answer_id_suspect_2).value
      @tannins_question_game_id_suspect_3 = @game_user.question_games.where(question_id: @tannins_question_id).where(wine_id: @game_suspect_3.wine_id).ids.first
      @tannins_answer_game_id_suspect_3 = @game_user_session.user_answers.where(question_game_id: @tannins_question_game_id_suspect_3).last.answer_game_id
      @tannins_answer_id_suspect_3 = AnswerGame.find(@tannins_answer_game_id_suspect_3).answer_id
      @tannins_suspect_3 = Answer.find(@tannins_answer_id_suspect_3).value

      @data_4_suspect_1 = @tannins_suspect_1
      @data_5_suspect_1 = @body_suspect_1
      @data_4_suspect_2 = @tannins_suspect_2
      @data_5_suspect_2 = @body_suspect_2
      @data_4_suspect_3 = @tannins_suspect_3
      @data_5_suspect_3 = @body_suspect_3
      @data_4_guilty = @tannins_guilty
      @data_5_guilty = @body_guilty
    end
  end

  def endgame
    @game_user = GameUser.find(params[:game_user_id])
    @game_user_session =  GameUserSession.find(params[:id])
    @game_suspect = GameSuspect.find(params[:suspect_id])
    # condition avoiding recalculation of score
    if @game_user_session.finished == false
    compute_score
    # 1/ game_user_session is finished
    @game_user_session.finished = true
    # 2/ game_user_session is won or lost?
    if @game_user.wine == @game_suspect.wine
      @game_user_session.win = true
      @game_user_session.final_score += 300
    else
      @game_user_session.win = false
    end
    # 3/ save game_user_session changes
    @game_user_session.save
    # 4/ change the game_user status if all players have finished the game
    @counter = 0
    @all_gus = GameUserSession.where(game_user: @game_user)
    @all_gus.each do |gus|
      gus.finished == true ? @counter += 1 : @counter
    end
    @counter == @all_gus.count ? @game_user.finished = true : @game_user.finished = false
    @game_user.save
    end
    # 5/ order players for ranking
    @players = GameUserSession.where(game_user_id: @game_user)
    @players = @players.sort {|a, b| b[:final_score] <=> a[:final_score]}

    @user = current_user
    @game = @game_user.game
    if @game.game_category.id == 3
      @game_suspects = []
      @game_suspect_1 = @game_user_session.game_user.game_suspects.where(position: 1).first
      @game_suspects << @game_suspect_1
      @game_suspect_2 = @game_user_session.game_user.game_suspects.where(position: 2).first
      @game_suspects << @game_suspect_2
      @game_suspect_3 = @game_user_session.game_user.game_suspects.where(position: 3).first
      @game_suspects << @game_suspect_3

      @sweetness_suspect_1 = @game_suspect_1.wine.sweetness
      @acidity_suspect_1 = @game_suspect_1.wine.acidity
      @alcohol_suspect_1 = @game_suspect_1.wine.alcohol
      @body_suspect_1 = @game_suspect_1.wine.body
      @length_suspect_1 = @game_suspect_1.wine.length
      @tannins_suspect_1 = @game_suspect_1.wine.tannins
      @sweetness_suspect_2 = @game_suspect_2.wine.sweetness
      @acidity_suspect_2 = @game_suspect_2.wine.acidity
      @alcohol_suspect_2 = @game_suspect_2.wine.alcohol
      @body_suspect_2 = @game_suspect_2.wine.body
      @length_suspect_2 = @game_suspect_2.wine.length
      @tannins_suspect_2 = @game_suspect_2.wine.tannins
      @sweetness_suspect_3 = @game_suspect_3.wine.sweetness
      @acidity_suspect_3 = @game_suspect_3.wine.acidity
      @alcohol_suspect_3 = @game_suspect_3.wine.alcohol
      @body_suspect_3 = @game_suspect_3.wine.body
      @length_suspect_3 = @game_suspect_3.wine.length
      @tannins_suspect_3 = @game_suspect_3.wine.tannins

      @tasting_color_question_id = Question.where(theme: "Regardez dans votre verre").where(wine_color: @game_user.game.wine.color.capitalize).ids.first
      @tasting_color_question_game_id_tasting_1 = @game_user.question_games.where(question_id: @tasting_color_question_id).where(wine_id: @game_suspect_1.wine_id).ids.first
      @tasting_color_answer_game_id_tasting_1 = @game_user_session.user_answers.where(question_game_id: @tasting_color_question_game_id_tasting_1).last.answer_game_id
      @tasting_color_answer_id_tasting_1 = AnswerGame.find(@tasting_color_answer_game_id_tasting_1).answer_id
      @tasting_color_tasting_1 = Answer.find(@tasting_color_answer_id_tasting_1).value
      @tasting_color_question_game_id_tasting_2 = @game_user.question_games.where(question_id: @tasting_color_question_id).where(wine_id: @game_suspect_2.wine_id).ids.first
      @tasting_color_answer_game_id_tasting_2 = @game_user_session.user_answers.where(question_game_id: @tasting_color_question_game_id_tasting_2).last.answer_game_id
      @tasting_color_answer_id_tasting_2 = AnswerGame.find(@tasting_color_answer_game_id_tasting_2).answer_id
      @tasting_color_tasting_2 = Answer.find(@tasting_color_answer_id_tasting_2).value
      @tasting_color_question_game_id_tasting_3 = @game_user.question_games.where(question_id: @tasting_color_question_id).where(wine_id: @game_suspect_3.wine_id).ids.first
      @tasting_color_answer_game_id_tasting_3 = @game_user_session.user_answers.where(question_game_id: @tasting_color_question_game_id_tasting_3).last.answer_game_id
      @tasting_color_answer_id_tasting_3 = AnswerGame.find(@tasting_color_answer_game_id_tasting_3).answer_id
      @tasting_color_tasting_3 = Answer.find(@tasting_color_answer_id_tasting_3).value

      @aromas_family_question_id = Question.where(theme: "Sentez maintenant!").where(wine_color: @game_user.wine.color.capitalize).ids.first
      @aromas_family_question_game_id_tasting_1 = @game_user.question_games.where(question_id: @aromas_family_question_id).where(wine_id: @game_suspect_1.wine_id).ids.first
      @aromas_family_answer_game_id_tasting_1 = @game_user_session.user_answers.where(question_game_id: @aromas_family_question_game_id_tasting_1).last.answer_game_id
      @aromas_family_answer_id_tasting_1 = AnswerGame.find(@aromas_family_answer_game_id_tasting_1).answer_id
      @aromas_family_tasting_1 = Answer.find(@aromas_family_answer_id_tasting_1).value
      @aromas_family_question_game_id_tasting_2 = @game_user.question_games.where(question_id: @aromas_family_question_id).where(wine_id: @game_suspect_2.wine_id).ids.first
      @aromas_family_answer_game_id_tasting_2 = @game_user_session.user_answers.where(question_game_id: @aromas_family_question_game_id_tasting_2).last.answer_game_id
      @aromas_family_answer_id_tasting_2 = AnswerGame.find(@aromas_family_answer_game_id_tasting_2).answer_id
      @aromas_family_tasting_2 = Answer.find(@aromas_family_answer_id_tasting_2).value
      @aromas_family_question_game_id_tasting_3 = @game_user.question_games.where(question_id: @aromas_family_question_id).where(wine_id: @game_suspect_3.wine_id).ids.first
      @aromas_family_answer_game_id_tasting_3 = @game_user_session.user_answers.where(question_game_id: @aromas_family_question_game_id_tasting_3).last.answer_game_id
      @aromas_family_answer_id_tasting_3 = AnswerGame.find(@aromas_family_answer_game_id_tasting_3).answer_id
      @aromas_family_tasting_3 = Answer.find(@aromas_family_answer_id_tasting_3).value

      @sweetness_question_id = Question.where(theme: "Goutez maintenant! la douceur").where(wine_color: @game_user.wine.color.capitalize).ids.first
      @sweetness_question_game_id_tasting_1 = @game_user.question_games.where(question_id: @sweetness_question_id).where(wine_id: @game_suspect_1.wine_id).ids.first
      @sweetness_answer_game_id_tasting_1 = @game_user_session.user_answers.where(question_game_id: @sweetness_question_game_id_tasting_1).last.answer_game_id
      @sweetness_answer_id_tasting_1 = AnswerGame.find(@sweetness_answer_game_id_tasting_1).answer_id
      @sweetness_tasting_1 = Answer.find(@sweetness_answer_id_tasting_1).value
      @sweetness_question_game_id_tasting_2 = @game_user.question_games.where(question_id: @sweetness_question_id).where(wine_id: @game_suspect_2.wine_id).ids.first
      @sweetness_answer_game_id_tasting_2 = @game_user_session.user_answers.where(question_game_id: @sweetness_question_game_id_tasting_2).last.answer_game_id
      @sweetness_answer_id_tasting_2 = AnswerGame.find(@sweetness_answer_game_id_tasting_2).answer_id
      @sweetness_tasting_2 = Answer.find(@sweetness_answer_id_tasting_2).value
      @sweetness_question_game_id_tasting_3 = @game_user.question_games.where(question_id: @sweetness_question_id).where(wine_id: @game_suspect_3.wine_id).ids.first
      @sweetness_answer_game_id_tasting_3 = @game_user_session.user_answers.where(question_game_id: @sweetness_question_game_id_tasting_3).last.answer_game_id
      @sweetness_answer_id_tasting_3 = AnswerGame.find(@sweetness_answer_game_id_tasting_3).answer_id
      @sweetness_tasting_3 = Answer.find(@sweetness_answer_id_tasting_3).value

      @acidity_question_id = Question.where(theme: "Goutez! l'acidité").where(wine_color: @game_user.wine.color.capitalize).ids.first
      @acidity_question_game_id_tasting_1 = @game_user.question_games.where(question_id: @acidity_question_id).where(wine_id: @game_suspect_1.wine_id).ids.first
      @acidity_answer_game_id_tasting_1 = @game_user_session.user_answers.where(question_game_id: @acidity_question_game_id_tasting_1).last.answer_game_id
      @acidity_answer_id_tasting_1 = AnswerGame.find(@acidity_answer_game_id_tasting_1).answer_id
      @acidity_tasting_1 = Answer.find(@acidity_answer_id_tasting_1).value
      @acidity_question_game_id_tasting_2 = @game_user.question_games.where(question_id: @acidity_question_id).where(wine_id: @game_suspect_2.wine_id).ids.first
      @acidity_answer_game_id_tasting_2 = @game_user_session.user_answers.where(question_game_id: @acidity_question_game_id_tasting_2).last.answer_game_id
      @acidity_answer_id_tasting_2 = AnswerGame.find(@acidity_answer_game_id_tasting_2).answer_id
      @acidity_tasting_2 = Answer.find(@acidity_answer_id_tasting_2).value
      @acidity_question_game_id_tasting_3 = @game_user.question_games.where(question_id: @acidity_question_id).where(wine_id: @game_suspect_3.wine_id).ids.first
      @acidity_answer_game_id_tasting_3 = @game_user_session.user_answers.where(question_game_id: @acidity_question_game_id_tasting_3).last.answer_game_id
      @acidity_answer_id_tasting_3 = AnswerGame.find(@acidity_answer_game_id_tasting_3).answer_id
      @acidity_tasting_3 = Answer.find(@acidity_answer_id_tasting_3).value

      @alcohol_question_id = Question.where(theme: "Goutez! l'alcool").where(wine_color: @game_user.wine.color.capitalize).ids.first
      @alcohol_question_game_id_tasting_1 = @game_user.question_games.where(question_id: @alcohol_question_id).where(wine_id: @game_suspect_1.wine_id).ids.first
      @alcohol_answer_game_id_tasting_1 = @game_user_session.user_answers.where(question_game_id: @alcohol_question_game_id_tasting_1).last.answer_game_id
      @alcohol_answer_id_tasting_1 = AnswerGame.find(@alcohol_answer_game_id_tasting_1).answer_id
      @alcohol_tasting_1 = Answer.find(@alcohol_answer_id_tasting_1).value
      @alcohol_question_game_id_tasting_2 = @game_user.question_games.where(question_id: @alcohol_question_id).where(wine_id: @game_suspect_2.wine_id).ids.first
      @alcohol_answer_game_id_tasting_2 = @game_user_session.user_answers.where(question_game_id: @alcohol_question_game_id_tasting_2).last.answer_game_id
      @alcohol_answer_id_tasting_2 = AnswerGame.find(@alcohol_answer_game_id_tasting_2).answer_id
      @alcohol_tasting_2 = Answer.find(@alcohol_answer_id_tasting_2).value
      @alcohol_question_game_id_tasting_3 = @game_user.question_games.where(question_id: @alcohol_question_id).where(wine_id: @game_suspect_3.wine_id).ids.first
      @alcohol_answer_game_id_tasting_3 = @game_user_session.user_answers.where(question_game_id: @alcohol_question_game_id_tasting_3).last.answer_game_id
      @alcohol_answer_id_tasting_3 = AnswerGame.find(@alcohol_answer_game_id_tasting_3).answer_id
      @alcohol_tasting_3 = Answer.find(@alcohol_answer_id_tasting_3).value

      @body_question_id = Question.where(theme: "Goutez! le corps").where(wine_color: @game_user.wine.color.capitalize).ids.first
      @body_question_game_id_tasting_1 = @game_user.question_games.where(question_id: @body_question_id).where(wine_id: @game_suspect_1.wine_id).ids.first
      @body_answer_game_id_tasting_1 = @game_user_session.user_answers.where(question_game_id: @body_question_game_id_tasting_1).last.answer_game_id
      @body_answer_id_tasting_1 = AnswerGame.find(@body_answer_game_id_tasting_1).answer_id
      @body_tasting_1 = Answer.find(@body_answer_id_tasting_1).value
      @body_question_game_id_tasting_2 = @game_user.question_games.where(question_id: @body_question_id).where(wine_id: @game_suspect_2.wine_id).ids.first
      @body_answer_game_id_tasting_2 = @game_user_session.user_answers.where(question_game_id: @body_question_game_id_tasting_2).last.answer_game_id
      @body_answer_id_tasting_2 = AnswerGame.find(@body_answer_game_id_tasting_2).answer_id
      @body_tasting_2 = Answer.find(@body_answer_id_tasting_2).value
      @body_question_game_id_tasting_3 = @game_user.question_games.where(question_id: @body_question_id).where(wine_id: @game_suspect_3.wine_id).ids.first
      @body_answer_game_id_tasting_3 = @game_user_session.user_answers.where(question_game_id: @body_question_game_id_tasting_3).last.answer_game_id
      @body_answer_id_tasting_3 = AnswerGame.find(@body_answer_game_id_tasting_3).answer_id
      @body_tasting_3 = Answer.find(@body_answer_id_tasting_3).value

      @label = []
      if @game_user.game.wine.color.capitalize == "Blanc"
        @label_4 = "Corps"
        @label_5 = "Longueur"
        @length_question_id = Question.where(theme: "Goutez! la longueur").where(wine_color: @game_user.game.wine.color.capitalize).ids.first
        @length_question_game_id_tasting_1 = @game_user.question_games.where(question_id: @length_question_id).where(wine_id: @game_suspect_1.wine_id).ids.first
        @length_answer_game_id_tasting_1 = @game_user_session.user_answers.where(question_game_id: @length_question_game_id_tasting_1).last.answer_game_id
        @length_answer_id_tasting_1 = AnswerGame.find(@length_answer_game_id_tasting_1).answer_id
        @length_tasting_1 = Answer.find(@length_answer_id_tasting_1).value
        @length_question_game_id_tasting_2 = @game_user.question_games.where(question_id: @length_question_id).where(wine_id: @game_suspect_2.wine_id).ids.first
        @length_answer_game_id_tasting_2 = @game_user_session.user_answers.where(question_game_id: @length_question_game_id_tasting_2).last.answer_game_id
        @length_answer_id_tasting_2 = AnswerGame.find(@length_answer_game_id_tasting_2).answer_id
        @length_tasting_2 = Answer.find(@length_answer_id_tasting_2).value
        @length_question_game_id_tasting_3 = @game_user.question_games.where(question_id: @length_question_id).where(wine_id: @game_suspect_3.wine_id).ids.first
        @length_answer_game_id_tasting_3 = @game_user_session.user_answers.where(question_game_id: @length_question_game_id_tasting_3).last.answer_game_id
        @length_answer_id_tasting_3 = AnswerGame.find(@length_answer_game_id_tasting_3).answer_id
        @length_tasting_3 = Answer.find(@length_answer_id_tasting_3).value
        @data_4_tasting_1 = @body_tasting_1
        @data_5_tasting_1 = @length_tasting_1
        @data_4_tasting_2 = @body_tasting_2
        @data_5_tasting_2 = @length_tasting_2
        @data_4_tasting_3 = @body_tasting_3
        @data_5_tasting_3 = @length_tasting_3
        @data_4_suspect_1 = @body_suspect_1
        @data_5_suspect_1 = @length_suspect_1
        @data_4_suspect_2 = @body_suspect_2
        @data_5_suspect_2 = @length_suspect_2
        @data_4_suspect_3 = @body_suspect_3
        @data_5_suspect_3 = @length_suspect_3
      else
        @label_4 = "Tannins"
        @label_5 = "Corps"
        @tannins_question_id = Question.where(theme: "Goutez! les tannins").where(wine_color: @game_user.game.wine.color.capitalize).ids.first
        @tannins_question_game_id_tasting_1 = @game_user.question_games.where(question_id: @tannins_question_id).where(wine_id: @game_suspect_1.wine_id).ids.first
        @tannins_answer_game_id_tasting_1 = @game_user_session.user_answers.where(question_game_id: @tannins_question_game_id_tasting_1).last.answer_game_id
        @tannins_answer_id_tasting_1 = AnswerGame.find(@tannins_answer_game_id_tasting_1).answer_id
        @tannins_tasting_1 = Answer.find(@tannins_answer_id_tasting_1).value
        @tannins_question_game_id_tasting_2 = @game_user.question_games.where(question_id: @tannins_question_id).where(wine_id: @game_suspect_2.wine_id).ids.first
        @tannins_answer_game_id_tasting_2 = @game_user_session.user_answers.where(question_game_id: @tannins_question_game_id_tasting_2).last.answer_game_id
        @tannins_answer_id_tasting_2 = AnswerGame.find(@tannins_answer_game_id_tasting_2).answer_id
        @tannins_tasting_2 = Answer.find(@tannins_answer_id_tasting_2).value
        @tannins_question_game_id_tasting_3 = @game_user.question_games.where(question_id: @tannins_question_id).where(wine_id: @game_suspect_3.wine_id).ids.first
        @tannins_answer_game_id_tasting_3 = @game_user_session.user_answers.where(question_game_id: @tannins_question_game_id_tasting_3).last.answer_game_id
        @tannins_answer_id_tasting_3 = AnswerGame.find(@tannins_answer_game_id_tasting_3).answer_id
        @tannins_tasting_3 = Answer.find(@tannins_answer_id_tasting_3).value

        @data_4_tasting_1 = @tannins_tasting_1
        @data_5_tasting_1 = @body_tasting_1
        @data_4_tasting_2 = @tannins_tasting_2
        @data_5_tasting_2 = @body_tasting_2
        @data_4_tasting_3 = @tannins_tasting_3
        @data_5_tasting_3 = @body_tasting_3
        @data_4_suspect_1 = @tannins_suspect_1
        @data_5_suspect_1 = @body_suspect_1
        @data_4_suspect_2 = @tannins_suspect_2
        @data_5_suspect_2 = @body_suspect_2
        @data_4_suspect_3 = @tannins_suspect_3
        @data_5_suspect_3 = @body_suspect_3
      end
    end
  end

  private

  def game_user_session_params
    params.require(:game_user_session).permit(:team_name, :photo)
  end

  def user_answer_params
    params.require(:user_answer).permit(:question_game_id, :answer_game_id, :game_user_session)
  end

  def compute_score
    @game_user = GameUser.find(params[:game_user_id])
    @game_user_session = GameUserSession.find(params[:id])
    @game = @game_user.game
    @user_answers = @game_user_session.user_answers
    @score = 0
    @user_answers.each do | user_answer |
      if user_answer.answer_game.good_answer && user_answer.joker_user == false
        @score += 100
      elsif user_answer.answer_game.good_answer && user_answer.joker_user == nil
        @score += 100
      elsif user_answer.answer_game.good_answer && user_answer.joker_user == true
        @score += 50
      end
    end
    @tasting_score = @score - @game_user_session.provisional_score
    @game_user_session.final_score = @score
    if @game.game_category.id == 3
      @game_user_session.score = @tasting_score / 21
    elsif @game.game_category.id == 1
      @game_user_session.score = @tasting_score / 7
    end
    @game_user_session.save
  end

end
