class MatchesController < ApplicationController

  # GET /matchs
  # GET /matchs.json
  def index
    @matches = match.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @matches }
    end
  end

  # GET /matchs/1
  # GET /matchs/1.json
  def show
    @match = Match.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @match }
    end
  end

  # GET /matchs/new
  # GET /matchs/new.json
  def new
    @match = Match.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @match }
    end
  end

  # GET /matchs/1/edit
  def edit
    @match = match.find(params[:id])
  end

  # POST /matchs
  # POST /matchs.json
  def create
    @match = Match.new(params[:match])

    respond_to do |format|
      if @match.save
        session[:match_id] = @match.id
        
        format.html { redirect_to new_match_game_path(@match) }
        format.json { render json: @match, status: :created, location: @match }
      else
        format.html { render action: "new" }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /matchs/1
  # PUT /matchs/1.json
  def update
    @match = match.find(params[:id])

    respond_to do |format|
      if @match.update_attributes(params[:match])
        format.html { redirect_to @match, notice: 'match was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matchs/1
  # DELETE /matchs/1.json
  def destroy
    @match = match.find(params[:id])
    @match.destroy

    respond_to do |format|
      format.html { redirect_to matchs_url }
      format.json { head :no_content }
    end
  end
end
