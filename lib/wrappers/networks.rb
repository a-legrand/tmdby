module Tmdby
  class Networks

    # This method is used to retrieve the basic information about a TV network
    def self.get(id)
        Tmdby::Client.get "network/#{id}"
    end
  end
end
