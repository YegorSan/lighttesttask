class User < ActiveRecord::Base
    
    has_many :posts
    has_many :comments
    
    def self.create_with_omniauth(auth)
      create! do |user|
       user.provider = auth['provider']
       user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
       end
     end
    end
    
     def normalimage
       "http://graph.facebook.com/#{self.uid}/picture?type=normal"
     end


end
