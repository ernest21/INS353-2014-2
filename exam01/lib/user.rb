class User
  attr_accessor :user_name,:posts
  def initialize (user_name)
    @user_name = user_name
    @posts = []
  end

  def add_post date, text, title
    post = Post.new self, title,text,date
    posts << posts
  end
end
