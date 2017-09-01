class UserAnswersController < ApplicationController
  def index
    @user_answers = policy_scope(User_answer)
  end

  def create
    authorize @user_answer
  end
end
