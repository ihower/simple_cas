module Castronaut
  module Adapters
    module Demo
      class Adapter
      
        def self.authenticate(username, password)
          return Castronaut::AuthenticationResult.new(username, nil)
        end
      
      end
    end
  end
end
