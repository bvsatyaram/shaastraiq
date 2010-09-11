class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :answers, :dependent => :destroy

  after_update :save_answers

#  validates_associated :answers
  validates_presence_of :content
  validate :question_has_four_answers_of_which_only_one

  def answer_attributes=(answer_attributes)
    answer_attributes.each do |attributes|
      attributes[:correct] ||= false
      if attributes[:id].blank?
        answers.build(attributes)
      else
        answer = answers.detect {|a| a.id == attributes[:id].to_i}
        answer.attributes = attributes
      end
    end
  end

  private

  def save_answers
    answers.each do |a|
      a.save(false)
    end
  end

  def question_has_four_answers_of_which_only_one
    errors.add(:answers, "can't be blank") if (answers.size != 4) || (answers.any?{|a| a.content.blank?})
    errors.add(:answers, "should have a correct answer") if (answers.any?{|a| ![true, false].include?(a.correct)}) || (answers.select{|a| a.correct?}.size != 1)
  end
end
