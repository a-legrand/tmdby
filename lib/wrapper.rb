module Tmdby
  class Wrapper

    def self.route(route)
      if @root and not @root.empty? and not route.empty?
        "#{@root}/#{route}"
      else
        "#{@root}#{route}"
      end
    end

    def self.fetch(route = "", parameters = {})
      response = Tmdby::Client.get self.route(route), parameters
    end
  end
end
