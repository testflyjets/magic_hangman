class Game < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :match

  before_save :select_word

  def select_word
    words = Word.count
    rand_id = rand(1..words)
    self.word_id = Word.find(rand_id).id
  end

  def category
    Word.find(self.word_id).category if self.word_id
  end
end
