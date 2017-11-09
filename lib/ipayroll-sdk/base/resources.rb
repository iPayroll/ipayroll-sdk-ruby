require 'ipayroll-sdk/models/link'
require 'ipayroll-sdk/models/page'
require 'ipayroll-sdk/base/attr_reader'

module IpayrollSdk
  module Base
    class Resources < AttrReader
      object_attr_reader :links, IpayrollSdk::Models::Link
      object_attr_reader :page, IpayrollSdk::Models::Page
      object_attr_reader :content, :content_klass

      def first_page
        find_page 'first'
      end

      def next_page
        find_page 'next'
      end

      def last_page
        find_page 'last'
      end

      def find_page(rel)
        links.collect do |link|
          if link.rel == rel
            return link
          end
        end
        nil
      end
    end
  end
end
