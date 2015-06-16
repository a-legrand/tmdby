module Tmdby
  class Networks < Wrapper

    @root = "network"

    # This method is used to retrieve the basic information about a TV network
    def self.get(id)
        self.fetch id
    end
  end
end
