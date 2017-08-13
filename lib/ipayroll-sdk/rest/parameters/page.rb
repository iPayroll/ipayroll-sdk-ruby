module IpayrollSdk
  module Rest
    module Parameters
      class Page
        include IpayrollSdk::Utils::Hashable

        attr_writer :page, :size

        def initialize(page, size)
          @page = page
          @size = size
        end

      end
    end
  end
end