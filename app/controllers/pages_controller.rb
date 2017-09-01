class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :confirmation]
  skip_after_action :verify_authorized, only: [:game_in_progress, :progame_in_progress, :game_pro_version, :home, :confirmation]

  def home
  end

  def confirmation
    if params["format"]
     @user = User.find(params["format"])
     if @user.confirmation_token == params["confirmation_token"]
       @user.confirmed_at = Time.now
       @user.save
     end
   end
  end

  def game_in_progress
    @my_hosting_gips = GameUser.where(finished: false).where.not(password: nil).where(user: current_user)
    @all_gips = GameUser.where(finished: false).where.not(password: nil)
    @my_gips = []
    @my_hosting_gips.each do |gip|
      @my_gips << gip
    end

    @all_gips.each do |all_gip|
      @game_user_sessions = GameUserSession.where(game_user: all_gip).where(user: current_user)
      @game_user_sessions.each do |game_user_session|
        if game_user_session.user == current_user && all_gip.password == game_user_session.session_password
          @my_gips << all_gip
        end
      end
    end
    @my_gips = @my_gips.sort_by{|e| GameUserSession.where(game_user: e).where(user: current_user).first[:created_at]}.reverse
    @gips = @all_gips - @my_gips
    @gips = @gips.reverse
  end

  def progame_in_progress
    @progips = []
    @gips = GameUser.where(finished: false)
    @gips.each do |gip|
      @progips << gip if gip.game.game_category.id == 3
    end
  end

end
