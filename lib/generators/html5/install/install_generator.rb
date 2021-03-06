require "generators/html5/generator_helpers"

module Html5
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      include Html5::Generators::GeneratorHelpers

      source_root File.expand_path('../templates', __FILE__)

      class_option :template_engine

      # def run_config
      #   inside do
      #     # Needs more work
      #     run("bundle exec compass config --app rails -r compass-h5bp -q")
      #   end
      # end

      def copy_configs
        template "config/compass.rb"
        template "config/html5_rails.yml"
      end

      def generate_layout
        invoke "html5:layout", ["application"], { :minimal_partials => true, :template_engine => options[:template_engine] }
      end

      def generate_assets
        invoke "html5:assets", ["application"]
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end
