module Tmdby
  class Wrapper

    def self.route(route)
      route = route.to_s if route.is_a? Integer

      if @root and not @root.empty? and not route.empty?
        "#{@root}/#{route}"
      else
        "#{@root}#{route}"
      end
    end

    def self.fetch(route = "", *args, method: "get", authorized_params: [], **params)
      params.merge!(args[0]) if not args.empty?

      # TODO add special var to disable this check ??
      self.verify_params(params, authorized_params)

      Tmdby::Client.api_call method, self.route(route), params
    end

    def self.verify_params(params, authorized)
      params.each do |key, _|
        raise RuntimeError, "Unknown argument : #{key}\nAuthorized arguments : #{authorized.join(', ')}" if not authorized.include? key.to_s
      end
    end
  end
end
