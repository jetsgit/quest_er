class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    @questions = Question.all
    respond_with(@questions)
  end

  def show
    respond_with(@question)
  end

  def new
    @question = Question.new
    respond_with(@question)
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      @question.users << current_user
      respond_with(@question)
    else 
      render action: 'new'
    end
    
  end

  def update
    if @question.update(question_params)
      @question.users << current_user
      respond_with(@question)
    else 
      render action: 'edit'
    end
    
  end

  def destroy
    @question.destroy
    respond_with(@question)
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:question, :answer)
    end
end
