#!/usr/bin/env ruby

require 'highline/import'
require 'versionomy'

class Wizard
  attr_reader :name, :start_version, :end_version

  def run
    say('Welcome to the ember-cli-deploy badge creator!')

    @name = ask('What is the name of your plugin?') do |q|
      q.validate = /\A(\w|-|_)+\z/
    end

    @start_version = ask('What is the first supported ember-cli-deploy version?', lambda(&method(:extract_version))) do |q|
      q.validate = lambda { |v| v.empty? ? false : extract_version(v) }
    end

    @end_version = ask('What is the last supported ember-cli-deploy version (if any)?', lambda(&method(:extract_version))) do |q|
      q.validate = lambda { |v| v.empty? ? true : extract_version(v) }
    end
    self
  end

  private

  def extract_version(v)
    v.empty? ? false : Versionomy.parse(v)
  rescue Versionomy::Errors::ParseError
    false
  end
end

class Output
  def initialize(wizard)
    @wizard = wizard
  end

  def to_yml
    yml = <<STR
---
layout: plugin
start_version: #{wizard.start_version.unparse(required_fields: [:major, :minor, :tiny])}
STR

    if wizard.end_version
      yml += "end_version: #{wizard.end_version.unparse(required_fields: [:major, :minor, :tiny])}\n"
      yml += "max_supported_version: #{serialize_version(wizard.end_version)}\n"
    end

    yml += <<STR
permalink: /plugins/#{wizard.name}.svg
---
STR

    yml
  end

  private

  attr_reader :wizard

  def serialize_version(v)
    b = v.beta_version rescue 0
    sprintf("%03d%03d%03d%03d", v.major, v.minor, v.tiny, b)
  end
end

class Writer
  def initialize(name, data)
    @name = "#{name}.md"
    @data = data
  end

  def write
    File.open(path, 'w+') do |f|
      f << data
    end
  end

  def path
    File.join(File.dirname(File.expand_path((__FILE__))), "/plugins/#{name}")
  end

  private

  attr_reader :name, :data
end

class PluginCreator
  def run
    wizard = Wizard.new.run
    data = Output.new(wizard).to_yml
    Writer.new(wizard.name, data).write
  end
end

PluginCreator.new.run
