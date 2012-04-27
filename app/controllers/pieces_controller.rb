class PiecesController < ApplicationController
  
  def new
    @piece = Piece.new
    @user = current_user
    @title = "New Piece"
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @piece }
    end
  end
  
  def show
    @piece = Piece.find(params[:id])
    @title = @piece.name
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @piece }
    end
  end
    
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
