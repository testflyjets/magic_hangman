module GuessesHelper

  ALPHABET = ('A'..'Z').to_a

  def guesses(all_guesses)
    letters = ''
    ALPHABET.each do |ltr|
      css_class = all_guesses.include?(ltr) ? 'guessed' : ''
      letters += content_tag :span, ltr, class: css_class
    end
    letters.html_safe
  end

  def word_board(word, good_guesses)
    board = ""
    word.each_char do |ltr|
      show_letter = good_guesses.include?(ltr.upcase) ? ltr : "&nbsp;".html_safe
      board += content_tag :div, show_letter, class: :word_letter
    end
    board.html_safe
  end
end
