["post", "user"].each do |f|
    require_relative File.join(File.dirname(__FILE__), '..', "lib/#{f}.rb")
end

require "yaml"

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end
