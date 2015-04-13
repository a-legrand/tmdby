module Tmdby
  class Credits < Wrapper

    @root = 'credit'

    # Get the detailed information about a particular credit record
    def self.get(credit_id, optional_params = {})
      self.fetch credit_id,
                  optional_params,
                  authorized_params: ["language"]
    end
  end
end
