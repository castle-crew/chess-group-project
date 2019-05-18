class GamesController < ApplicationController
  before_action :authenticate_user!

  def new
    @game = Game.new
    after_create :populate_board!
  
  end

  def create
    @game.create(game_params)
    redirect_to game_path(:id) #changed from game_id because I agreed with Donny's thoughts on the row number issue
  end

  def show
    @game = Game.find(params[:id, :white_player, :black_player, :winner])

    if @user.valid?
      redirect_to game_path
    else
      redirect_to new_user_session_path
    end

  end

  private

  def game_params
    params.require(:game).permit(:game_id, :white_player, :black_player, :winner)
  end
end


