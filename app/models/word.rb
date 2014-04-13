class Word < ActiveRecord::Base
  attr_accessible :category, :word

  NOVICE_WORD_LENGTH = 6
  EXPERT_WORD_LENGTH = 12

  def novice_word?
    word.length <= NOVICE_WORD_LENGTH
  end

  def expert_word?
    word.length > NOVICE_WORD_LENGTH
  end

  def for_level?(level)
    level == 1 ? novice_word? : expert_word?
  end

  def guessed?(good_guesses)
    guessed = true
    word.split(//).each do |ltr|
      guessed = guessed && good_guesses.include?(ltr.upcase)
      return false if !guessed
    end
    true
  end
end
