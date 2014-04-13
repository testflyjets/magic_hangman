class GamesController < ApplicationController

  # GET /games
  # GET /games.json
  def index
    @games = current_match.games.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  # GET /games/new
  # GET /games/new.json
  def new
    @game = current_match.games.create
    reset_game

    respond_to do |format|
      format.html { redirect_to new_game_guess_url(@game)}
      format.json { render json: @game }
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = current_session.games.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to current_session }
      format.json { head :no_content }
    end
  end

  private

  def reset_game
    session[:game_id] = @game.id
    session[:bad_guesses] = []
    session[:good_guesses] = []
    Rails.logger.debug "** word is: #{@game.word}"
  end
end
