require "rack/fuzzing/version"

module Rack
  class Fuzzing
    class << self
      attr_accessor :irregular_responses, :condition

      def confiuration(&block)
        yield(self)
      end
    end

    def initialize(app)
      @app = app
      yield(self.class) if block_given?
    end

    def call(env)
      if self.class.condition.respond_to?(:call) ? self.class.condition.call : self.class.condition
        @app.dup.call(env)
      else
        self.class.irregular_responses.sample
      end
    end
  end
end
