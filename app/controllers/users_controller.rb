# encoding: utf-8

class UsersController < ApplicationController
  before_action :find_user, only: [:update, :destroy]

  def index
    users = User.paginate(page: params[:page], per_page: params[:per_page || 25])
    render json: {
      count: users.count,
      users: users.as_json(include: :emails)
    }
  end

  def create
    render json: User.create!(user_data)
  end

  def destroy
    @user.destroy!
    head :no_content
  end

  # not used
  # def update
  #   @user.update! user_data
  #   head :no_content
  # end

  private

  def user_data
    params.require(:user).permit(:name, :birth_date, emails_attributes: [:id, :email, :_destroy])
  end

  def find_user
    @user = User.find(params[:id])
  end
end
