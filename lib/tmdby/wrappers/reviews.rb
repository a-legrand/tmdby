module Tmdby
  class Reviews < Wrapper

    @root = "review"

    # Get the full details of a review by ID
    def self.get(id)
      self.fetch id
    end
  end
end
