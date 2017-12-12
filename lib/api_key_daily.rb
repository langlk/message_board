require 'rack/throttle'

class ApiKeyDaily < Rack::Throttle::Daily
  protected
  def client_identifier(request)
    return request.params["key"]
  end
end
