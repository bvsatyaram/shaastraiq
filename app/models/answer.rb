class Answer < ActiveRecord::Base
  belongs_to :question

#  validates_presence_of :content
#  validates_presence_of :question
#  validates_presence_of :correct

  def correct?
    self.correct
  end
end
