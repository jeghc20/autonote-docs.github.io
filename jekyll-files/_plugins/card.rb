module Jekyll
    module Tags
        class CardTag < Liquid::Block
            def initialize(tag_name, block_options, liquid_options)
              super
              # Remove any trailing or leading spaces and store the passed ID and default index.
              options = block_options.gsub(/\s+/m, ' ').strip.split(" ")
              @cardID = (0...8).map { (65 + rand(26)).chr }.join
              @defaultOpenIndex = options[1] || 0
            end
      
            def render(context)
              # To account for if accordions are inside accordions, store previous data on the stack.
              context.stack do
                # Store the accordion ID in context so that children can access it (i.e. the collapsible)
                context["cardID"] = @cardID
                context["defaultOpenIndex"] = @defaultOpenIndex
                context["buttonIndex"] = 1
                # Pass the context down to children
                # Store the output from those blocks so it is accessible from outside the stack
                site = context.registers[:site]
                converter = site.find_converter_instance(::Jekyll::Converters::Markdown)
                @content = converter.convert(super)
              end
      
              # Render the block
                output = %(<div class="card"><div class="card-body">#{@content}</div></div>)
            output
            end
        end
        class CardButtonTag < Liquid::Block
            def initialize(tag_name, block_options, liquid_options)
              super
              # Store the title passed as arguments
              @title = block_options.strip
            end
      
            def render(context)
              # store the information passed from the parent accordion
              cardID = context["cardID"]
              buttonID = (0...8).map { (65 + rand(26)).chr }.join
              defaultOpenIndex =  context["defaultOpenIndex"] 
              idx = context["buttonIndex"]
      
              # generate the IDs for the collapsible
              buttonID = "#{cardID}-collapse-#{idx}"

              # increment for the next collapsible, storing it in context
              context["buttonIndex"] = idx + 1
      
              # Render any lower level content (manually... because markdown inside HTML isn't rendered)
              site = context.registers[:site]
              converter = site.find_converter_instance(::Jekyll::Converters::Markdown)
              content = converter.convert(super)
      
              # generate collapsible card HTML
              output = <<~EOS
                <p><a class="btn btn-primary" data-bs-toggle="collapse" href="##{buttonID}" role="button" aria-expanded="false" aria-controls="#{buttonID}">
                        #{@title} </a></p>
                <div class="collapse" id="#{buttonID}">
                    <div class="card card-body">
                        #{content}
                    </div></div>
                    EOS
      
              output
            end
        end
    end
  end
  
  Liquid::Template.register_tag('card', Jekyll::Tags::CardTag)
  Liquid::Template.register_tag('button', Jekyll::Tags::CardButtonTag)
  

  # See http://mikelui.io/2018/07/22/jekyll-nested-blocks.html
  