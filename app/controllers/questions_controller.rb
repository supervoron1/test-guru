class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :destroy, :update, :edit]
  before_action :find_test, only: [:new, :index, :create, :show, :destroy, :update, :edit]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
    @question
  end

  def index
    @questions = @test.questions
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to @test, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @test, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to @test, notice: 'Question was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def rescue_with_question_not_found
    render plain: "404. Question was not found"
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
