# encoding: utf-8

class UsersController < ApplicationController

  def index
    render json: ::User.all.preload(:emails).map(&:json_for_users_app).to_json
  end

  def destroy
    ::User.find(params[:id]).destroy!
  end

end
