class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :show, :index, :forfeit]

  def new
    game = Game.new
  end

  def index
    @games = Game.all
  end

  def create
    game = current_user.games.create(game_params)

    if game.valid?
      redirect_to game_path(game)
    end
  end

  def show
    game = Game.find_by_id(params[:id])
  end

  def update
    game = Game.find_by_id(params[:id])

    if current_user && game.black_player == nil
      game.update_attribute(:black_player, current_user.id)
    end
  end

  def forfeit

    @game = Game.find_by_id(params[:id])
    
    unless @game
      return "A horrible error has occurred of which we cannot recover!"
    end

    user = current_user.id()

    # Future refactor
    # TODO: We don't actually need the if loser or if winner in the real app

    if game_params[:white_player] == user 
      @game.update(winner: game_params[:black_player])

      loser = Player.find_by_id(user)    
      if loser
        loser.update(loses: loser.loses.to_i + 1)
      end
      winner = Player.find_by_id(game_params[:black_player])
      if winner
        winner.update(wins: winner.wins.to_i + 1)
      end
    else
      @game.update(winner: game_params[:white_player])
      loser = Player.find_by_id(user)    
      if loser
        loser.update(loses: loser.loses.to_i + 1)
      end
      winner = Player.find_by_id(game_params[:white_player])
      if winner
        winner.update(wins: winner.wins.to_i + 1)
      end
    end 
    redirect_to root_path
  
  end

  def check
    game = Game.find_by(id: id)
    if game.check?("white") == true
      flash[:notice] = "Careful . . . your king is in check"
      redirect_to game
    end
    if game.check?("black") == true
      flash[:notice] = "Careful . . . your king is in check"
      redirect_to game
    end
  end

  private

  def game_params
    params.require(:game).permit(:id, :white_player, :black_player, :winner, :loser)
  end
end


