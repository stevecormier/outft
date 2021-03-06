class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @title = "Users"
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @pieces = @user.pieces
    @title = @user.name
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @title = "Sign up"
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @title = "Edit User"
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    
    respond_to do |format|
      if @user.save
        sign_in @user
        format.html { redirect_to @user, :notice => 'User was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        @title = "Sign up"
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    @title = @user.name
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end
  
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end
  
  def pieces
    @title = "Pieces"
    @user = User.find(params[:id])
    @users = @user.pieces
    render 'show_pieces'
  end
  
  def svpply
    @title = "svpply"
    @user = current_user
    render 'svpply'
  end  
  
  def multiple_create
    
    @user = current_user
    
    if params[:pieces].is_a?(Hash)
      @piece_hashes = params[:pieces].values
    else
      @piece_hashes = params[:pieces]
    end

    @piece_hashes.each do |piece_hash|
      @piece = @user.pieces.new(piece_hash)
      @piece.image_from_url
      @piece.save
    end
    
    redirect_to @user
    
  end
  
end
