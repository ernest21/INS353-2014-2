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
end
