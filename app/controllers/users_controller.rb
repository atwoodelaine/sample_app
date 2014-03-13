class UsersController < ApplicationController
  def new
  	@title = "Sign up"
  end

  def show 
  	@user = User.find(params[:id])
  end 

  def create
    Person.create(person_params)
  end

  private

  def person_params
    params.require(:person).permit(:name, :email, :password)
  end
end