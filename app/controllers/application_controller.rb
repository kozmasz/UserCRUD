class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordInvalid do |exception|
    render json: { errors: exception.record.errors },
         status: :unprocessable_entity
  end
end
