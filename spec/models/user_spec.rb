require 'spec_helper'

describe User do

  it "should create users from omniauth data" do
    auth = { :provider => 'twitter',
             :uid => '123434',
             :info => {
               :nickname => 'foo'
             }
    }

    new_user = User.create_from_omniauth(auth)
    new_user.provider.should == auth['provider']
    new_user.uid.should == auth['uid']
    new_user.name.should == auth[:info]['nickname']
  end

end
