require "bcrypt"
module Castronaut
  module Adapters
    module Devise
      
      class User < ActiveRecord::Base
        
        cattr_accessor :encryptor, :stretches, :pepper
        
        def self.authenticate(username, password)
          if user = find_by_email(username)
            if user.valid_password?(password)
              Castronaut::AuthenticationResult.new(username, nil)
            else
              Castronaut.config.logger.info "#{self} - Unable to authenticate username #{username} due to invalid authentication information"
              Castronaut::AuthenticationResult.new(username, "Unable to authenticate")
            end
          else
            Castronaut.config.logger.info "#{self} - Unable to authenticate username #{username} because it could not be found"
            Castronaut::AuthenticationResult.new(username, "Unable to authenticate")
          end
        end
        
        def valid_password?(incoming_password)
          password_digest(incoming_password) == self.encrypted_password
        end
        
        def password_digest(password)
          self.class.encryptor ||= Bcrypt
          self.class.stretches ||= 10
          
          self.class.encryptor.digest(password, self.class.stretches , self.password_salt, self.class.pepper )
        end
        
      end
    
      class Bcrypt
        def self.digest(password, stretches, salt, pepper)
          ::BCrypt::Engine.hash_secret([password, pepper].join, salt, stretches)
        end
      end
    
    end
  end
end
