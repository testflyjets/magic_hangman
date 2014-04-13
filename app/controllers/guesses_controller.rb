class GuessesController < ApplicationController

  before_filter :current_game
  before_filter :current_category
  
  # GET /guesses/new
  # GET /guesses/new.json
  def new

  end

  # POST /guesses
  # POST /guesses.json
  def create
    Rails.logger.debug "** Word is: #{@current_game.word}"
    guess = params[:guess]
    if @current_game.good_guess?(guess)
      session[:good_guesses] << guess.upcase
    else
      session[:bad_guesses] << guess.upcase
    end

    if current_game.game_lost?(bad_guesses.size)
      flash[:notice] = "Oh, no, you lost! The word was: #{@current_game.word}"
      redirect_to new_match_path
    elsif current_game.word_guessed?(good_guesses)
      flash[:notice] = "Yay, you won!"
      redirect_to new_match_path
    else
      redirect_to new_game_guess_path(current_game)
    end
  end

end
