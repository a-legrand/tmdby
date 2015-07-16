module Tmdby
  class Wrapper
    class << self
      attr_accessor :root, :params, :clean_params, :post_params
    end

    # Compute api route
    def self.route(route)
      route = route.to_s if route.is_a? Integer

      if @root and not @root.empty? and not route.empty?
        "#{@root}/#{route}"
      else
        "#{@root}#{route}"
      end
    end

    # Verify that every parameter is allowed by the api
    def self.verify_params(authorized)
      @params.each do |key, _|
        raise RuntimeError, "Unknown argument : #{key}\nAuthorized arguments : #{authorized.join(', ')}" if not authorized.include? key.to_s
      end
    end

    # Add default language to parameters if it has been setted
    def self.add_default_language
      default_language = Tmdby::Setup.default_language

      if default_language && !@params.key?('language') && !@params.key?(:language)
        @params['language'] = default_language
      end
    end

    # Dispatch params in 2 hashes : one for api url parameters, another on for api post parameters
    def self.handle_post_params(post_param_names)
      @clean_params = {}
      @post_params  = {}

      @params.each do |k, v|
        if post_param_names.include?k or post_param_names.include?k.to_s
          @post_params[k.to_s] = v if v
        else
          @clean_params[k.to_s] = v if v
        end
      end
    end

    def self.fetch(route = "", *args)

      if args.length == 0
        options = {}
      elsif args.length == 1
        options = args[0]
      elsif args.length == 2
        options = args[1].merge(args[0])
      end

      method = options.fetch(:method, 'get')
      post_params = options.fetch(:post_params, [])
      authorized_params = options.fetch(:authorized_params, [])
      disable_unknown_params = options.fetch(:disable_unknown_params, false)
      [:method, :post_params, :authorized_params, :disable_unknown_params].each do |key|
        options.delete(key)
      end

      @params = options

      self.add_default_language if authorized_params.include?'language'
      self.verify_params authorized_params unless disable_unknown_params or authorized_params.include?"append_to_response"
      self.handle_post_params post_params

      Tmdby::Client.api_call method, self.route(route), @clean_params, @post_params
    end


  end
end
