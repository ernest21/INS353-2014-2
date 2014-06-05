class Post
  attr_accessor :user, :date, :title, :text, :tags
  def initialize (*args)
    if args.size == 1
      load_yml path
    elsif args.size == 4
      @user = args[0]
      @title = args[1]
      @text = args[2]
      @date = args[3]

    else
      raise ArgumentError
    end
    @tags =  []
  end

  private
  def load_yml path
  end
end
