require "rack/fuzzing/version"

module Rack
  class Fuzzing
    def initialize(app)
      @app = app
    end

    def call(env)
      @app.dup.call(env)
    end
  end
end
