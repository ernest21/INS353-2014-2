require 'spec_helper'

describe User do
  before(:all) {@user = User.new "ernest"}

  describe "#initialize" do
    it "should properly initialize with an username" do
      expect(@user).to be_instance_of(User)
    end
  end

  describe "#add_post" do
    it "should add a post to the posts list" do
      @user.add_post "2014-6-6", "Lalala LALA laa "*10, "My awsome post"
      expect(@user.posts.size).to eql(1)
    end
  end

  describe "#list" do
    it "should properly ouput all posts" do
      prueba =%Q(ernest, 2014-6-5
Title
#{"Test Test Test"*10}
Tags: test, post

ernest, 2014-6-6
My awsome post
#{"Lalala LALA laa "*10}
Tags:
)
    expect { @user.list}.to output(prueba).to_stdout
    end
  end

  describe "#find_post_by_title" do
    it "should return a post by title"
    it "should return the first one if there are several with the same name"
  end

end
