module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid do |exception|
      render json: exception.record.errors, status: :unprocessable_entity
    end
  end
end
