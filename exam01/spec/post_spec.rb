require 'spec_helper'

describe Post do
  before :all do
    entry = Post.new( User.new ("ernest"),"Tittle",  \
    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",\
      "2014-6-5"), ["lorem", "greek", "test"]
    File.open "post.yml", 'w' do |f|
      f.write YAML::dump entry
    end
  end

  describe "#initialize" do
    context "with a yaml file" do
      it "should properly load a post from a yaml file" do
        post= Post.new "post.yml"
        expect(post).to be_instance_of(Post)
      end
    end

    context "with proper attributes" do
      it "should properly initialize a post instance"
    end

  end
  describe "#summary" do
    it "should display the first 10 words of text"
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
