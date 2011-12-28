class OutfitsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @outfit = @user.outfits.create(params[:outfit])
    redirect_to user_path(@user)
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @outfit = @user.outfits.find(params[:id])
    @outfit.destroy
    redirect_to user_path(@user)
  end
  
end
