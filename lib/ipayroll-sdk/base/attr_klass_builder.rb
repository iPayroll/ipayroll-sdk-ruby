module IpayrollSdk
  module Base
    module AttrKlassBuilder

      URIBuilder = Class.new

      BUILDER = {
          URI => URIBuilder
      }.freeze

      def build(klass, attrs)
        builder = BUILDER[klass]
        if builder.nil?
          klass.new(attrs)
        else
          builder.build(attrs)
        end

      end

      def URIBuilder.build(value)
        URI.parse(value)
      end

    end
  end
end