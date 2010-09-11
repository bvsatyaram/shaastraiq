class QuestionsController < ApplicationController
  before_filter :fetch_quiz, :can_manage_quizzes?
  uses_tiny_mce

  # GET /questions
  # GET /questions.xml
  def index
    @questions = @quiz.questions.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.xml
  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.xml
  def new
    @question = @quiz.questions.new

    4.times { @question.answers.build }

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = @quiz.questions.find(params[:id])
  end

  # POST /questions
  # POST /questions.xml
  def create
    @question = @quiz.questions.new(params[:question])

    respond_to do |format|
      @question.save
      if @question.errors.blank?
        flash[:notice] = 'Question was successfully created.'
        format.html { redirect_to(quiz_questions_path(@quiz)) }
        format.xml  { render :xml => @question, :status => :created, :location => @question }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.xml
  def update
    @question = @quiz.questions.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        flash[:notice] = 'Question was successfully updated.'
        format.html { redirect_to(quiz_questions_path(@quiz)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.xml
  def destroy
    @question = @quiz.questions.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to(quiz_questions_url(@quiz)) }
      format.xml  { head :ok }
    end
  end

  private

  def fetch_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def can_manage_quizzes?
    # Check its
  end
end
