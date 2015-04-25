require 'sinatra/base'
require 'rack/fuzzing'
require 'sinatra'
require 'sinatra/reloader'

use Rack::Fuzzing

get '/' do
  "hello world"
end
