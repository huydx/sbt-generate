begin
  require "thor"
rescue LoadError
  puts "Thor is not available"
  exit
end

module Sbt
  module Generator
    class Error < Thor::Error
    end

    class Base < Thor
      desc "generate", "generate sbt project by some options"
      option :project_name, :required => true
      option :config_file, :required => true
      def genenrate()
        base_root
        p base_root
      end

      private
        def base_root
          File.dirname(__FILE__)
        end
    end
  end
end
