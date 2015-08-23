module Sbt
  module Generator
    class SbtConfig
      attr_accessor :config,
        :project_name,
        :organization_name,
        :libraries

      def initialize(config)
        @config = config
        @project_name = config["project_name"]
        @organization_name = config["organization_name"]
        @libraries = config["libraries"]
      end

      def get_binding
        binding()
      end

      def self.parse(file)
        require "yaml"

        conf = YAML.load_file(file)
        SbtConfig.new(conf)
      end
    end
  end
end
