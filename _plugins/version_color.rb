module Jekyll
  class VersionColorTag < Liquid::Tag
    def render(context)
      tag_contents = determine_arguments(@markup.strip)
      stable_version, plugin_end_version = tag_contents[0], tag_contents[1]
      if context.has_key?(stable_version)
        stable_version = context[stable_version]
      end
      if context.has_key?(plugin_end_version)
        plugin_end_version = context[plugin_end_version]
      end

      if Gem::Version.new(plugin_end_version) < Gem::Version.new(stable_version)
        "#e05d44"
      else
        "#ac1"
      end
    rescue ArgumentError
      return "#ac1"
    end

    def determine_arguments(input)
      matched = input.match(/\A([\S]+|.*(?=\/).+)\s?(\S*)\Z/)
      [matched[1].strip, matched[2].strip] if matched && matched.length >= 3
    end
  end
end

Liquid::Template.register_tag('version_color', Jekyll::VersionColorTag)
