class GamesController < ApplicationController
  before_action :authenticate_user!

  def new
    @game = Game.new
  end

  def create
    user = FactoryBot.create(:user)
      sign_in user

    game = current_user.games.create(game_params)
  end

  def show
    @game = Game.find(game_params)  #params[:id]
    if user_signed_in?
      redirect_to game_path
    else
      redirect_to new_user_session_path
    end

  end

  private

  def game_params
    params.require(:game).permit(:game_id)
  end
end


