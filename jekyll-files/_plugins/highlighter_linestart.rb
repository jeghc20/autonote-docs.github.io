# frozen_string_literal: true

module Jekyll
  module Tags
    class HighlightBlock < Liquid::Block
      include Liquid::StandardFilters

      # The regular expression syntax checker. Start with the language specifier.
      # Follow that by zero or more space separated options that take one of three
      # forms: name, name=value, or name="<quoted list>"
      #
      # <quoted list> is a space-separated list of numbers
      SYNTAX = %r!^([a-zA-Z0-9.+#_-]+)((\s+\w+(=(\w+|"([0-9]+\s)*[0-9]+"))?)*)$!.freeze

      def initialize(tag_name, markup, tokens)
        super
        if markup.strip =~ SYNTAX
          @lang = Regexp.last_match(1).downcase
          @highlight_options = parse_options(Regexp.last_match(2))
        else
          raise SyntaxError, <<~MSG
            Syntax Error in tag 'highlight' while parsing the following markup:

            #{markup}

            Valid syntax: highlight <lang> [linenos] [startline] [enddots] [noselect]
          MSG
        end
      end

      LEADING_OR_TRAILING_LINE_TERMINATORS = %r!\A(\n|\r)+|(\n|\r)+\z!.freeze

      def render(context)
        prefix = context["highlighter_prefix"] || ""
        suffix = context["highlighter_suffix"] || ""
        code = super.to_s.gsub(LEADING_OR_TRAILING_LINE_TERMINATORS, "")

        output =
          case context.registers[:site].highlighter
          when "rouge"
            render_rouge(code)
          when "pygments"
            render_pygments(code, context)
          else
            render_codehighlighter(code)
          end

        rendered_output = add_code_tag(output)
        prefix + rendered_output + suffix
      end

      private

      OPTIONS_REGEX = %r!(?:\w="[^"]*"|\w=\w|\w)+!.freeze

      def parse_options(input)
        options = {}
        return options if input.empty?

        # Split along 3 possible forms -- key="<quoted list>", key=value, or key
        input.scan(OPTIONS_REGEX) do |opt|
          key, value = opt.split("=")
          # If a quoted list, convert to array
          if value&.include?('"')
            value.delete!('"')
            value = value.split
          end
          options[key.to_sym] = value || true
        end

        options[:linenos] = "inline" if options[:linenos] == true
        options[:startline] = Integer(options[:startline]) if options[:startline]
        options[:enddots] = true if options[:enddots] == true || options[:enddots] == "true"
        options[:noselect] = true if options[:noselect] == true || options[:noselect] == "true"
        options
      end

      def render_pygments(code, _context)
        Jekyll.logger.warn "Warning:", "Highlight Tag no longer supports rendering with Pygments."
        Jekyll.logger.warn "", "Using the default highlighter, Rouge, instead."
        render_rouge(code)
      end

      def render_rouge(code)
        require "rouge"
        formatter = ::Rouge::Formatters::HTMLLegacy.new(
          :line_numbers => @highlight_options[:linenos],
          :start_line   => @highlight_options[:startline] || 1,
          :wrap         => false,
          :css_class    => "highlight",
          :gutter_class => "gutter",
          :code_class   => "code"
        )
        lexer = ::Rouge::Lexer.find_fancy(@lang, code) || Rouge::Lexers::PlainText
        formatter.format(lexer.lex(code))
      end

      def render_codehighlighter(code)
        h(code).strip
      end

      def add_code_tag(code)
        start_line_value = @highlight_options[:startline] || 1
        dots_end = @highlight_options[:enddots] || false
        no_select = @highlight_options[:noselect] || false

        code_attributes = [
          "class=\"language-#{@lang.to_s.tr("+", "-")}\"",
          "data-lang=\"#{@lang}\"",
        ].join(" ")

        msg = "<figure class=\"highlight\"><figcaption class='code'>Code snippet</figcaption><pre"
        msg += " class=\"noselect\"" if no_select == true
        msg += ">"
        msg += "<div class=\"snippit\">...</div>" if start_line_value != 1
        msg += "<code #{code_attributes}>"\
              "#{code.chomp}</code>"
        msg += "<div class=\"snippit\">...</div>" if dots_end == true
        msg + "</pre></figure>" 
      end
    end
  end
end

Liquid::Template.register_tag("highlight", Jekyll::Tags::HighlightBlock)
