module Broogle
  class BehaviorMixer
    attr_reader :klass
    attr_reader :options

    def initialize(klass, options)
      @klass = klass
      @options = Options.new(options)
    end

    def mix
      options.behaviors.each do |mixin|
        klass.include(mixin)
      end
    end
  end
end
