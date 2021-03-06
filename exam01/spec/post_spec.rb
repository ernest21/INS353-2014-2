require 'spec_helper'

describe Post do
  before :all do
    user = User.new ("ernest")
    entry = Post.new( user,"Title", "Test Test Test","2014-6-5")
    File.open "post.yml", 'w' do |f|
      f.write YAML::dump entry
    end
  end

  before(:each) do
    @user = User.new ("ernest")
    @post = Post.new( @user,"Title", "Test Test Test"*10,"2014-6-5")
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
    it "should be able to tag with 1 tag" do
      @post.tagme :test
      expect(@post.tags.size).to eql(1)
    end
    it "should be able to tag with 4 tags" do
      @post.tagme :test, :entry, :lla, :tag
      expect(@post.tags.size).to eql(4)
    end
  end

  describe "#same?" do
    it "should return true if Title, Date and Text are the same" do
      p = Post.new( @user,"Title", "Test Test Test"*10,"2014-6-5")
      expect(@post.same? p).to be(true)
    end
    it "should return false if Title, Date and Text are not the same" do
      p = Post.new( @user,"Title", "Test"*10,"2013-6-8")
      expect(@post.same? p).to be(false)
    end
  end

  describe "#display_entry" do
    it "should properly output a post entry" do
      prueba =%Q(ernest, 2014-6-5
Title
#{"Test Test Test"*10}
Tags: test, post
)
      @post.tagme :test, :post
       expect { @post.display_entry}.to output(prueba).to_stdout
    end
  end

  describe "#save" do
    it "should save the post to a YAML file" do
      @post.save
      p = Post.new "title.yml"
      expect(@post).to match(p)
    end
  end

end
