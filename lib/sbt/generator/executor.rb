module Sbt
  module Generator
    class Executor
      require "erb"

      def self.execute(config)
        #note: we are currently in generated folder
        erb_files =
          Dir.glob("**/*").reject do |file_path|
            !!(File.directory? file_path) && (File.extname(file_path) != "erb")
          end

        erb_files.each do |origin|
          # replace with config
          file_content = File.new(origin).read
          template = ERB.new(file_content, nil, ">")
          result = template.result(config.get_binding)

          # rename & put result
          new_name = origin.gsub(".erb","")
          if new_name.include? "MyProject" # rename MyProject.scala
            new_name = new_name.gsub("MyProject", config.project_name)
          end

          File.rename(origin, new_name)
          File.write(new_name, result)
        end
      end
    end
  end
end
