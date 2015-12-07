module Concerns::Errors
  def error(e, status = 500)
    raise e if Rails.env.test?

    if status == 500
      level = 'error'
    else
      level = 'warning'
    end

    Rails.logger.error(e)
    Rails.logger.error(e.backtrace)

    error_info = {
      id: 'server_error',
      message: "#{e.class.name} : #{e.message}"
    }
    error_info[:trace] = e.backtrace[0, 20] if Rails.env.development?
    render json: { error: error_info }, status: status
  end

  def validation_error(e, status = 422)
    error = {
      id: 'validation_error',
      message: e.errors
    }
    render json: { error: error }, status: status
  end

  def request_error(message, status)
    error = {
      id: 'request_error',
      message: message
    }
    render json: { error: error }, status: status
  end
end
