module Tmdby
  class Movies < Wrapper

    @root = "movie"

    def self.get(id)
      self.fetch id
    end
  end
end
