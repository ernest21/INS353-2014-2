require 'spec_helper'

describe Post do
  before :all do
    user = User.new ("ernest")
    entry = Post.new( user,"Tittle", "Test Test Test","2014-6-5")
    File.open "post.yml", 'w' do |f|
      f.write YAML::dump entry
    end
  end

  before(:each) do
    @user = User.new ("ernest")
    @post = Post.new( @user,"Tittle", "Test Test Test"*10,"2014-6-5")
  end

  describe "#initialize" do
    context "with a yaml file" do
      it "should properly load a post from a yaml file" do
        post= Post.new "post.yml"
        expect(post).to be_instance_of(Post)
        expect(post).to respond_to(:summary, :tagme, :same?, :display_entry, :save,:user, :date, :title, :text, :tags)
      end
    end

    context "with proper attributes" do
      it "should properly initialize a post instance" do
        expect(@post).to be_instance_of(Post)
        expect(@post).to respond_to(:summary, :tagme, :same?, :display_entry, :save,:user, :date, :title, :text, :tags)
      end
    end

  end
  describe "#summary" do
    it "should display the first 10 words of text" do
      expect(@post.summary.split.size).to eql(10)
    end
  end

  describe "#tagme" do
    it "should be able to tag with 1 tag"
    it "should be able to tag with 4 tags"
  end

  describe "#same?" do
    it "should return true if Title, Date and Text are the same"
    it "should return false if Title, Date and Text are not the same"
  end

  describe "#display_entry" do
    it "should properly output a post entry"
  end

  describe "#save" do
    it "should save the post to a YAML file"
  end

end
