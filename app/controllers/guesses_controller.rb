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

  end

end
