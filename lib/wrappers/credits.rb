module Tmdby
  class Credits < Wrapper

    @root = 'credit'

    # Get the detailed information about a particular credit record
    def self.get(credit_id, language = nil)
      self.fetch credit_id, {:language => language}
    end
  end
end
