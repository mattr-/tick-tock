require 'spec_helper'

describe ApplicationController do
  before do
    session['user_id'] = "foo"
  end

  describe "#current_user" do
    it "gets the currently logged in user" do
      user = stub
      User.stub(:find).with(session['user_id']).and_return(user)
      controller.current_user.should == user
    end

    it "returns nil if no logged in user" do
      User.stub(:find).with(session['user_id']).and_return(nil)
      controller.current_user.should == nil
    end
  end
end
