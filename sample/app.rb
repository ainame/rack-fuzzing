require 'sinatra/base'
require 'rack/fuzzing'
require 'sinatra'
require 'sinatra/reloader'
require 'json'

use Rack::Fuzzing::StubRandomResponse do |config|
  config.is_stubbed = -> { [true, false].sample }
  config.responses = [
    Rack::Response.new([{ error: "Bad Request" }.to_json], 400),
    Rack::Response.new([{ error: "Unauthorized" }.to_json], 401),
    Rack::Response.new([{ error: "Forbidden" }.to_json], 403),
    Rack::Response.new([{ error: "Conflict" }.to_json], 409),
    Rack::Response.new([{ error: "Too Many Requests" }.to_json], 429),
    Rack::Response.new([{ error: "Internal Server Error" }.to_json], 500),
    Rack::Response.new([{ error: "Bad Gateway" }.to_json], 502),
    Rack::Response.new([{ error: "Service Unavailable" }.to_json], 503),
  ]
end

get '/' do
  "hello world"
end
