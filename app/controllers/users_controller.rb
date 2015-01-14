class UsersController < ApplicationController
  # before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def show
    @questions = Question.joins("join questions_users on questions.id = questions_users.question_id").where(["questions_users.user_id = ?", current_user])
  end

end
