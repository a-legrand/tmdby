module Tmdby
  class Jobs < Wrapper

    @root = 'job'

    # Get a list of valid jobs
    def self.list
      self.fetch "list"
    end
  end
end
