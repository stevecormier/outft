class OutfitsController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    @outfits = @user.outfits
    @title = "Outfits"
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @outfits }
    end
  end
  
  def new
    @outfit = Outfit.new
    @user = current_user
    @title = "New Outfit"
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @outfit }
    end
  end
  
  def show
    @outfit = Outfit.find(params[:id])
    @title = @outfit.title
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @outfit }
    end
  end
  
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
