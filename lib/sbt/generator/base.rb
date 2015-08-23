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
      attr_accessor :dest, :option

      desc "generate", "generate sbt project by some options"
      option :config_file, :required => true
      option :template_name
      def generate(dest)
        @dest = dest
        @option = options
        @config = SbtConfig.parse(@option[:config_file])

        create_dir
        generate_and_copy
      end

      private

      def location
        "#{@dest}/#{@config[:project_name]}"
      end

      def create_dir
        Dir.mkdir(location)
      end

      def generate_and_copy
        require "erb"
        template_name = @option[:template_name] || default_template

        #copy dir
        FileUtils.copy_entry("#{erb_root}/#{template_name}", location)

        #change dir
        Dir.chdir(location)

        #replacing
        Executor.execute(@config)

        #remove erb

      end


      def base_root
        File.dirname(__FILE__)
      end

      def erb_root
        "#{base_root}/../erb"
      end

      def default_template
        "scala"
      end
    end
  end
end
