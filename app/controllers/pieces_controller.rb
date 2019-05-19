class PiecesController < ApplicationController

  def update
    @piece = Piece.find(params[:id])
    if @piece.valid_move?(params[:x_coord], params[:y_coord])
      @piece.update_attributes(:x_space => params[:x_coord], :y_space => params[:y_coord])
    else
      return render plain: 'Not Allowed', status: :forbidden
    end
    # TO DO: redirect_to game_show once built
  end

end
