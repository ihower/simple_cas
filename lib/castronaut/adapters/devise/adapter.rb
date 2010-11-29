module Castronaut
  module Adapters
    module Devise
      
      class Adapter
      
        def self.authenticate(username, password)
          Castronaut::Adapters::Devise::User.authenticate(username, password)
        end
      
      end
    
    end
  end
end
