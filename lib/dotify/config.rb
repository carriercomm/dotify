require 'dotify'
require 'thor/util'
require 'yaml'

module Dotify
  module Config

    extend self

    DEFAULTS = {
      :dirname => '.dotify',
      :file => '.dotrc',
      :editor => 'vim',
      :ignore => {
        :dotify => %w[.DS_Store .git .gitmodule],
        :dotfiles => %w[.DS_Store .Trash .dropbox .dotify]
      }
    }

    def dirname
      @dirname ||= DEFAULTS[:dirname]
    end

    def home(file_or_path = nil)
      file_or_path.nil? ? user_home : File.join(user_home, file_or_path)
    end

    def path(file_or_path = nil)
      joins = [self.home, dirname]
      joins << file_or_path unless file_or_path.nil?
      File.join *joins
    end

    def installed?
      File.exists?(path) && File.directory?(path)
    end

    def editor
      config.fetch(:editor, DEFAULTS[:editor])
    end

    def load_config!
      config = File.exists?(file) ? YAML.load_file(file) : {}
      symbolize_keys!(config)
    rescue TypeError
      {}
    end

    def ignore(what)
      (config.fetch(:ignore, {}).fetch(what, []) + DEFAULTS[:ignore].fetch(what, [])).uniq
    end

    def config
      @config || load_config!
    end

    def file
      File.join(home, DEFAULTS[:file])
    end

    private

      def user_home
        Thor::Util.user_home
      end

      def symbolize_keys!(opts)
        sym_opts = {}
        opts.each do |key, value|
          sym_opts[key.to_sym] = value.is_a?(Hash) ? symbolize_keys!(value) : value
        end
        sym_opts
      end

  end
end
