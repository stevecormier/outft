class PiecesController < ApplicationController
    
  def create
    @user = User.find(params[:user_id])
    @piece = @user.pieces.create(params[:piece])
    redirect_to user_path(@user)
  end
    
  def destroy
    @user = User.find(params[:user_id])
    @piece = @user.pieces.find(params[:id])
    @piece.destroy
    redirect_to user_path(@user)
  end
    
end
