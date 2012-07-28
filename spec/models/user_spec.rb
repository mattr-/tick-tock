require 'spec_helper'

describe User do

  before :each do
    @auth = { 
      :provider => 'twitter',
      :uid => '123434',
      :info => {
        :nickname => 'foo'
      },
      :credentials => {
        :token => 'qwezsdfer',
        :secret => 'zxzcvafwes'
      }
    }
  end

  it "should create users from omniauth data" do
    new_user = User.create_from_omniauth(@auth)
    new_user.provider.should == @auth['provider']
    new_user.uid.should == @auth['uid']
    new_user.name.should == @auth[:info]['nickname']
  end

  it "should find existing users from omniauth data" do
    User.create_from_omniauth(@auth)
    new_user = User.from_omniauth(@auth)
    new_user.provider.should == @auth['provider']
    new_user.uid.should == @auth['uid']
    new_user.name.should == @auth[:info]['nickname']
    new_user.oauth_token.should == @auth[:credentials][:token]
    new_user.oauth_secret.should == @auth[:credentials][:secret]
  end

end
