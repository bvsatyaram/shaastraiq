class QuizzesController < ApplicationController
  skip_before_filter :user_can_manage_quiz?

  def take
    if current_user.admin?
      @quizzes = Quiz.all
    else
#      @quiz = Quiz.all.rand
#      redirect_to quiz_path(@quiz)
    end
  end
end
