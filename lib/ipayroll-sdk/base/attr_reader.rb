module IpayrollSdk
  module Base
    class AttrReader
      include IpayrollSdk::Base::AttrKlassBuilder

      attr_reader :attrs, :attrsklass

      def initialize(attrs = {}, attrsklass = {})
        @attrs = attrs || {}
        @attrsklass = attrsklass || {}
      end

      class << self

        def attr_reader(*attrs)
          attrs.each do |attr|
            define_attribute_method(attr)
          end
        end

        def object_attr_reader(*keys, klass)
          keys.each {|key| define_attribute_method(key, klass)}
        end

        def define_attribute_method(key1, klass = nil)
          define_method(key1) do
            unless attr_value_or_empty?(key1)
              build_instances(key1, klass)
            end
          end
          define_method((key1.to_s + '=').to_sym) do |value|
            unless attr_value_or_empty?(key1)
              set_instances(key1, value)
            end
          end
          # memoize(key1)
        end

      end

      def build_instances(key1, klass)
        attrs = attrs_for_object(key1)
        if attrs.is_a?(Array)
          attrs.collect do |element|
            get_klass_instance(key1, klass, element)
          end
        else
          get_klass_instance(key1, klass, attrs)
        end
      end

      def set_instances(key, value)
        if !@attrs[key].nil?
          @attrs[key] = value
        elsif !@attrs[key.to_s].nil?
          @attrs[key.to_s] = value
        elsif !@attrs[key.to_s.camelize(:lower).to_sym].nil?
          @attrs[key.to_s.camelize(:lower).to_sym] = value
        elsif !@attrs[key.to_s.camelize(:lower)].nil?
          @attrs[key.to_s.camelize(:lower)] = value
        end
      end

      def get_klass_instance(key1, klassValue, attrs)
        klass = attrsklass[klassValue]
        if klass.nil?
          klass = klassValue
        end
        klass.nil? ? attrs_for_object(key1) : build(klass, attrs)
      end

      private

      def attr_value_or_empty?(key)
        !attrs_for_object(key) || attrs_for_object(key).respond_to?(:empty?) && attrs_for_object(key).empty?
      end

      def attrs_for_object(key)
        value = @attrs[key]
        if value.nil?
          value = @attrs[key.to_s]
        end
        if value.nil?
          camelized = key.to_s.camelize(:lower).to_sym
          value = @attrs[camelized]
        end
        value
      end

    end
  end
end
