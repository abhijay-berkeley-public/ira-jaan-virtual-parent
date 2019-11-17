class AdministratorController < ApplicationController
  def index
      # Needs to be implemented in context of being able to search for users
      # NEXT ITERATION
  end

  def administrator_params
      params.require(:administrator).permit(:username, :password, :name, :age, :email, :language, :description, :points)
  end

  def show
      id = params[:id]
      @admin = Administrator.find(id)
  end

  def new

  end

  def create
      @admin = Administrator.create!(administrator_params)
      flash[:notice] = "#{@admin.username}, your profile was successfully created."
      redirect_to administrator_path(@admin)
  end

  def edit
      @admin = Administrator.find params[:id]
  end

  def update
      @admin = Administrator.find params[:id]
      @admin.update_attributes!(administrator_params)
      flash[:notice] = "Your profile was successfully updated."
      redirect_to administrator_path(@admin)
  end

  def destroy
      # Not needed for now, placeholder code to be RESTful
      # Need to make sure that only the actual user can delete their own profile.
      @admin = Administrator.find params[:id]
      @admin.destroy
      flash[:notice] = "Your profile was deleted."
      redirect_to administrators_path
  end

  # Adds points to this administrator's account
  def add_points
      @admin = Administrator.find params[:id]
      params.require(:points)
      @admin.points = params[:points]
      @admin.save!
      flash[:notice] = "Points updated"
      redirect_to administrator_path(@admin)
  end
end
