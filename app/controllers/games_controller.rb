class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :show, :index, :forfeit]

  def new
    @game = Game.new
  end

  def index
    @games = Game.all
  end

  def create
    @game = current_user.games.create(game_params)

    if @game.valid?
      redirect_to game_path(@game)
    end
  end

  def show
    @game = Game.find_by_id(params[:id])
  end

  def update
    @game = Game.find_by_id(params[:id])

    if current_user && @game.black_player == nil
      @game.update_attribute(:black_player, current_user.id)
    end


  end

  def forfeit
  p "we have forfeit"
  @game = Game.find_by_id(params[:id])
  # current_user.id.games
  
  #   redirect_to game_path(@game)
  end

  private

  def game_params
    params.require(:game).permit(:id, :white_player, :black_player, :winner, :loser)
  end
end


