class TestsController < ApplicationController

  before_action :find_test, only: %i[show edit update destroy] # only: чтобы ограничить перед каким методом нужно вызывать
  after_action :send_log_message
  around_action :log_execute_time

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_test_not_found

  def index
    @tests = Test.all
    # render plain: 'Hello from RoR. All tests'
    # render html: '<h1>Hello from RoR. All tests</h1>'.html_safe
    # render json: { tests: @tests}
    # render inline: '<p>My favourite language is: <%= %[ybuR].reverse %></p>'
    # render file: '/public/hello', layout: false
    # render inline: '<%= console %>'
    # logger.info(self.object_id)
    # respond_to do |format|
    #   format.html { render html: '<h3 style="color: blue">Hello from RoR. All tests.</h3>'.html_safe }
    #   format.json { render json: { tests: Test.all } }
    # end
    # byebug
    # result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    # render plain: result.join("\n")
    # render inline: '<%= @tests %>'
  end

  def start
    render plain: 'Start certain test'
  end

  def show
    @questions = @test.questions
    # render inline: 'Show test <%= test %>'
    # render plain: 'Show test <%= test %>'
    # redirect_to root_path  # можно указать любой путь, либо указать prefix из rails/routes, н-р start_path
    # redirect_to 'https://vorontsov.biz'
    # render inline: '<%= @test.title %>'
  end

  def new
    @test = Test.new
  end

  def edit

  end

  def create
    # result=["Class: #{params.class}", "Parameters: #{params.inspect}"]
    # render plain: result.join("\n")
    # render plain: test.inspect
    @test = Test.new(test_params)
    respond_to do |format|
      if @test.save
        format.html { redirect_to tests_path, notice: 'Test was successfully created.' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to tests_path, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def search
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    render plain: result.join("\n")
  end

  private

  def send_log_message
    logger.info("Action [#{action_name}] was finished")
  end

  def log_execute_time
    start = Time.now
    yield
    finish = Time.now - start
    logger.info("Execution time: #{finish * 1000}ms")
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def rescue_from_test_not_found
    render plain: 'Test was not found'
  end

end
