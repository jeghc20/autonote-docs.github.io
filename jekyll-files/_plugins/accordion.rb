module Jekyll
  module Tags
    class AccordionTag < Liquid::Block
      def initialize(tag_name, block_options, liquid_options)
        super
        # Remove any trailing or leading spaces and store the passed ID and default index.
        options = block_options.gsub(/\s+/m, ' ').strip.split(" ")
        @accordionID = (0...8).map { (65 + rand(26)).chr }.join
        # @accordionID = "accordion-#{options[0].strip}"
        @defaultOpenIndex = options[0] || 0
      end

      def render(context)
        # To account for if accordions are inside accordions, store previous data on the stack.
        context.stack do
          # Store the accordion ID in context so that children can access it (i.e. the collapsible)
          context["accordionID"] = @accordionID
          context["defaultOpenIndex"] = @defaultOpenIndex
          context["bellowsIndex"] = 1
          # Pass the context down to children
          # Store the output from those blocks so it is accessible from outside the stack
          @content = super
        end

        # Render the block
        output = %(<div class="accordion" id="#{@accordionID}">#{@content}</div>)
        output
      end
    end

    class BellowsTag < Liquid::Block
      def initialize(tag_name, block_options, liquid_options)
        super
        # Store the title passed as arguments
        @title = block_options.strip
      end

      def render(context)
        # store the information passed from the parent accordion
        accordionID = context["accordionID"]
        defaultOpenIndex = context["defaultOpenIndex"]
        idx = context["bellowsIndex"]

        # generate the IDs for the collapsible
        bellowsID = "#{accordionID}-collapse-#{idx}"
        headingID = "#{accordionID}-heading-#{idx}"

        # increment for the next collapsible, storing it in context
        context["bellowsIndex"] = idx + 1

        # generate additional class for default open mode
        if (defaultOpenIndex.to_i == idx)
          ariaExpanded = "true"
          accordionCollapseClass = "accordion-collapse collapse show"
          accordionButtonClass = "accordion-button"
        else
          ariaExpanded = "false"
          accordionCollapseClass = "accordion-collapse collapse"
          accordionButtonClass = "accordion-button collapsed"
        end


        # Render any lower level content (manually... because markdown inside HTML isn't rendered)
        site = context.registers[:site]
        converter = site.find_converter_instance(::Jekyll::Converters::Markdown)
        content = converter.convert(super)

        # generate collapsible card HTML
        output = <<~EOS
          <div class="accordion-item">
            <h2 class="accordion-header" id="#{headingID}">
              <button class="#{accordionButtonClass}" type="button" data-bs-toggle="collapse" data-bs-target="##{bellowsID}" aria-expanded="#{ariaExpanded}" aria-controls="#{bellowsID}">
                #{@title}
              </button>
            </h2>
            <div id="#{bellowsID}" class="#{accordionCollapseClass}" aria-labelledby="#{headingID}" data-bs-parent="##{accordionID}">
              <div class="accordion-body">
                #{content}
              </div>
            </div>
          </div>
        EOS

        output
      end
    end
  end
end

Liquid::Template.register_tag('accordion', Jekyll::Tags::AccordionTag)
Liquid::Template.register_tag('bellows', Jekyll::Tags::BellowsTag)

# See http://mikelui.io/2018/07/22/jekyll-nested-blocks.html
