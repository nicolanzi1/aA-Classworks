require 'rack'

class RackApplication
  def self.call(env)
    ['200', {'Content-Type' => 'text/html'}, ["Hey there"]]
  end
end

class SimpleApp
  def self.call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new

    name = req.params['name']

    res.write("Hello #{name}")
    res.finish
  end
end

require 'json'

class CookieApp
  def self.call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new

    food = req.params['food']
    if food
      res.set_cookie(
        '_my_cookie_app',
        {
        path: '/',
        value: {food: food}.to_json
        }
      )
    else
      cookie = req.cookies['_my_cookie_app']
      cookie_val = JSON.parse(cookie)
      food = cookie_val['food']
      res.write("Yout favorite food is #{food}")
    end

    res.finish
  end
end

app =Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new

  if req.path.start_with?("/cage")
    res.status = 302
    res['Location'] = 'https://images.firstpost.com/wp-content/uploads/2018/04/nicolas-cage-380.jpg?impolicy=website&width=320&height=180'
  else
    res.write("Nothing to see here")
  end

  res.finish
end

Rack::Server.start({
  app: app,
  Port: 3000
})
