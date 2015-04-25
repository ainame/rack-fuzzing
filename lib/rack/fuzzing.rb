require "rack/fuzzing/version"

module Rack
  module Fuzzing
    class StubRandomResponse
      class << self
        attr_accessor :is_stubbed
        attr_accessor :responses

        def confiuration(&block)
          yield(self)
        end
      end

      def initialize(app)
        @app = app
        yield(self.class) if block_given?
      end

      def call(env)
        if self.class.is_stubbed.respond_to?(:call) ? self.class.is_stubbed.call : self.class.is_stubbed
          @app.dup.call(env)
        else
          self.class.responses.sample
        end
      end
    end
  end
end
