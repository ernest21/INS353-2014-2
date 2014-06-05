class User
  attr_accessor :user_name,:posts
  def initialize (user_name)
    @user_name = user_name
    @posts = []
  end
end
