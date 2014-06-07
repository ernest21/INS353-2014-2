require_relative 'post.rb'
class User
  attr_accessor :user_name,:posts
  def initialize (user_name)
    @user_name = user_name
    @posts = []
  end

  def add_post date, text, title
    post = Post.new self, title,text,date
    posts << post
  end

  def list
    posts.each{|post| post.display_entry}
  end
  def find_post_by_title title
    posts.select{|post| post.title == title }.first
  end
  def tag_cloud
    tags=[]
    posts.each{|post| post.tags.each{|tag| tags << tag}}
    t = tags.inject(Hash.new(0)) {|key,i| key[i] += 1; key }
    t.sort_by{|k,v| v}.reverse[0,5].each {|tag,count| puts "#{tag}: #{count}" }
  end
end
