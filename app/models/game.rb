class Game < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :match

  before_save :select_word

  MAX_GUESSES = 9

  def select_word
    words = Word.count
    begin
      rand_id = rand(1..words)
      word = Word.find(rand_id)
    end until word.for_level?(self.match.level)
    self.word_id = rand_id
  end

  def word_choice
    Word.find(self.word_id)
  end

  def word
    word_choice.word.upcase if self.word_id
  end

  def category
    word_choice.category if self.word_id
  end

  def good_guess?(guess)
    word.include? guess.upcase
  end

  def word_guessed?(good_guesses)
    word_choice.guessed?(good_guesses)
  end

  def game_lost?(bad_guess_count)
    bad_guess_count >= MAX_GUESSES
  end
end
