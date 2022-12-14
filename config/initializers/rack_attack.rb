class Rack::Attack
  throttle('api_ip',limit: 3,period: 10) do |req|
    req.ip
  end

  throttle('logins_ip',limit: 5,period: 20.seconds) do |req|
    if req.path == '/kittens' && req.post?
      req.params['email'].presence
    end
  end

  class Request< ::Rack::Request
    def subdomain
      host.split('.').first
    end
  end
end