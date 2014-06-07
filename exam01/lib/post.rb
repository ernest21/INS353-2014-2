require_relative 'user.rb'
require 'yaml'

class Post
  include Comparable
  attr_accessor :user, :date, :title, :text, :tags
  def initialize (*args)
    if args.size == 1
      load_yml args[0]
    elsif args.size == 4
      @user = args[0]
      @title = args[1]
      @text = args[2]
      @date = args[3]
      @tags = []
    else
      raise ArgumentError
    end

  end
  def summary
    text.split[0,10].join(" ")
  end
  def tagme (*args)
    args.each {|tag| tags << tag}
  end

  def same? other
    self == other
  end

  def display_entry
    puts %Q(#{self.user.user_name}, #{self.date}
#{self.title}
#{self.text}
Tags: #{tags.join(", ")})
  end

  def save
    File.open title.downcase.gsub(/\s+/, "-")+".yml", 'w' do |f|
        f.write YAML::dump self
      end
  end

  def <=> other
    [self.title, self.text, self.date] <=> [other.title, other.text, other.date]
  end
  private
  def load_yml path
    blog_yaml = YAML.load_file path
    @title= blog_yaml.title
    @text= blog_yaml.text
    @date= blog_yaml.date
    @user= blog_yaml.user
    @tags = blog_yaml.tags
  end
end
