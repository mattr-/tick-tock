class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth[:info]['nickname']
    end
  end

end
