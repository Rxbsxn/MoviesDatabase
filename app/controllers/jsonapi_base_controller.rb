class JSONAPIBaseController < JSONAPI::ResourceControllerMetal
  include Knock::Authenticable

  before_action :authenticate_user

  def head(type, options = {})
    if type == :unauthorized
      render json: {error: type}, status: 401
    else
      raise("Unhandled head: #{type} : #{options}")
    end
  end

  def context
    {
        current_user: current_user
    }
  end
end
