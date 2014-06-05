require_relative 'user.rb'
require 'yaml'

class Post
  attr_accessor :user, :date, :title, :text, :tags
  def initialize (*args)
    if args.size == 1
      load_yml args[0]
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
  def summary
    text.split[0,10].join(" ")
  end
  def tagme (*args)
    args.each {|tag| tags << tag}
  end

  def same?

  end

  def display_entry

  end

  def save

  end
  private
  def load_yml path
    bloag_ylm = YAML.load_file(path)
    @user = bloag_ylm.user
    @title = bloag_ylm.title
    @text = bloag_ylm.text
    @date = bloag_ylm.date
  end
end
