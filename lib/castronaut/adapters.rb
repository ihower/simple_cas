module Castronaut
  module Adapters
    
    def self.selected_adapter
      case Castronaut.config.cas_adapter['adapter']
        when "demo" : Castronaut::Adapters::Demo::Adapter
        when "devise" : Castronaut::Adapters::Devise::Adapter
        when "development" : Castronaut::Adapters::Development::Adapter
        when "database" : Castronaut::Adapters::RestfulAuthentication::Adapter
      end
    end
    
  end
end
