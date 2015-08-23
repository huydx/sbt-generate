%w(
  active_support/dependencies
).each {|lib| require lib}


%w(
  base
  config
  executor
).each {|file| require_dependency File.expand_path("../generator/#{file}", __FILE__)}

module Sbt
  module Generator
    def self.start!(args)
      Base.start(args)
    end
  end
end
