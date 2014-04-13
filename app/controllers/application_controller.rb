class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_player, :guess_count, :all_guesses, :bad_guess_count, :good_guesses

  def current_match
    @current_match ||= Match.find(session[:match_id])
  end

  def current_game
    @current_game ||= current_match.games.find(session[:game_id])
  end

  def current_player
    @current_player ||= current_match.player
  end

  def current_category
    @current_category ||= current_game.category
  end

  def guess_count
    @guess_count ||= session[:bad_guesses].size + session[:good_guesses].size
  end

  def bad_guess_count
    session[:bad_guesses].size
  end

  def good_guesses
    session[:good_guesses]
  end

  def all_guesses
    @all_guesses ||= session[:bad_guesses] + session[:good_guesses]
  end
end
