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
      @user.posts.last.tagme :test, :la, :post
      expect(@user.posts.size).to eql(1)
    end
  end

  describe "#list" do
    it "should properly ouput all posts" do
      prueba =%Q("ernest, 2014-6-6\nMy awsome post\nLalala LALA laa Lalala LALA laa Lalala LALA laa Lalala LALA laa Lalala LALA laa Lalala LALA laa Lalala LALA laa Lalala LALA laa Lalala LALA laa Lalala LALA laa \nTags: test, la, post\nernest, 2014-6-5\nTitle\nTest Test TestTest Test TestTest Test TestTest Test TestTest Test TestTest Test TestTest Test TestTest Test TestTest Test TestTest Test Test\nTags: test, entry, tag, post\n)
    @user.add_post "2014-6-5","Test Test Test"*10,"Title"
    @user.find_post_by_title "title"
     @user.posts.last.tagme :test, :entry, :tag, :post
    expect { @user.list}.to output(prueba).to_stdout
    end
  end

  describe "#find_post_by_title" do
    it "should return a post by title" do
      p= Post.new @user, "My awsome post", "Lalala LALA laa "*10, "2014-6-6"
      expect(@user.find_post_by_title ("My awsome post") ).to match(p)
    end
    it "should return the first one if there are several with the same name" do
        p= Post.new @user, "My awsome post", "Lalala LALA laa "*10, "2014-6-6"
        @user.add_post "2013-9-6", "bla bla"*10, "My awsome post"
        expect(@user.find_post_by_title ("My awsome post") ).to match(p)
    end
  end
  describe "#tag_cloud" do
    it "should  return the top 5 tags of a user" do
      u=User.new "Test user"
      u.add_post "2013-9-6", "bla bla"*10, "My awsome post"
      u.add_post "2014-4-4", "bla bla "*8, "My post"
      u.add_post "2013-1-2", "bla bla", "otro post"
      u.posts.each do |post|
        post.tagme :la, :la, :la, :otra, :otra, :test, :cool, :cono, :cono, :tag, :tag, :tag,:tag
      end
      hash_test=[[:tag, 12], [:la, 9], [:cono, 6], [:otra, 6], [:test, 3]]
      expect(u.tag_cloud).to match(hash_test)
    end
  end
end
