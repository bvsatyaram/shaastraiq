class QuizzesController < ApplicationController
  skip_before_filter :user_can_manage_quiz?, :only => [:take, :score, :instructions]
  before_filter :can_take_test?, :only => [:take]
  before_filter :can_score_test?, :only => [:score]

  def instructions
    if current_user.admin?
      redirect_to manage_path
    else
#      @quiz = Quiz.all.rand
#      redirect_to quiz_path(@quiz)
    end
  end

  def manage
    @quizzes = Quiz.all
  end

  def take
    current_user.update_attribute(:start_time, Time.now)
    @quiz = Quiz.all.rand
  end

  def score
    end_time = Time.now
    quiz_id = params[:quiz_id].to_i
    answers = params[:question].values.uniq.collect{|x| x.to_i}
    unanswered_questions_count = answers.select{|x| x == 0}.size
    answers.delete(0)
    correct_answers_count = Answer.all(:conditions => {:id => answers, :correct => true}).size
    wrong_answers_count = 15 - (unanswered_questions_count + correct_answers_count)
    time_in_seconds = (end_time - current_user.start_time)/1.second
    @score = compute_score(quiz_id, correct_answers_count, wrong_answers_count, time_in_seconds)
    current_user.update_attributes(
      :end_time => end_time,
      :correct_answers_count => correct_answers_count,
      :wrong_answers_count => wrong_answers_count,
      :score => @score
    )
  end

  private

  def compute_score(quiz_id, n, e, t)
    t = Float(t)/60
    quizzes_ids = Quiz.all(:select => :id).collect(&:id)

    if (quiz_id == quizzes_ids[0]) || (quiz_id == quizzes_ids[1])
      score = 90 + ((5*n - e)*15/t)
    elsif quiz_id == quizzes_ids[2]
      score = 95 + ((5*n - e)*15/t)
    elsif quiz_id == quizzes_ids[3]
      score = 100 + ((5*n - e)*15/t)
    end

    return score.to_i
  end

  def can_take_test?
    if current_user.start_time.present?
      flash[:notice] = 'Test can only be taken once.'
      redirect_to instructions_path
    end
  end

  def can_score_test?
    if current_user.score.present?
      flash[:notice] = 'Test can only be taken once.'
      redirect_to instructions_path
    end
  end
end
