class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_player

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
end
