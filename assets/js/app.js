
// In future this file could be split into page-wise functions/files,
// but having it all in one place should do for now.

// Call JS when the page has finished loading 
$( document ).ready(function() {
    // ---------------------
    // Numbering the image captions
    // ---------------------

    $('.figure-caption').each(function(i){
        let order_number = i+1
        // Add span element to caption to allow for custom styling
        $(this).prepend("<span class='figure-number'>Figure " + order_number + ".</span>" )
    })

    // ---------------------
    // Number citations and get all text
    // ---------------------
    
    var refbodies = []
    $('.refnum').each(function(i){
        let order_number = i +1
        $(this).text("["+order_number+"]")
        
        let refbody_text = $(this).siblings('.refbody').text()
        refbodies.push(refbody_text)

        $(this).parent().attr("id", "citation-"+order_number)
    })

    if(refbodies.length > 0){
        $(".citation_footer_wrapper").toggleClass("active")
        var citation_footer = $(".citation_footer")
        refbodies.forEach((text, i) => {
            let num = i+1
            // Maybe for anchors
            // citation_footer.append("<li><a href='#citation-"+num+"'>"+text+"</a></li>")
            citation_footer.append("<li>"+text+"</li>")
        })
    }
    // ---------------------
    // Handle citation clicks
    // ---------------------

    // Register click callback 
    $('.ref').on('click', function(e){
        // Remove all citations that are showing and activate new onw
        clear_citations()
        $(this).find('.refbody').toggleClass("active");
        // Add 'citation-active' class to body if not already there
        if(!$("body").hasClass("citation-active")){
            $("body").toggleClass("citation-active")
        }
    })
    // Register body click callback
    $('body').on('click', function(e){
        // Check if there is a citation active
        if($('body').hasClass('citation-active')){
            // If there is, and the click isn't on a citation
            // then remove all citations
           let classes = $(e.target).attr('class')
           if(!classes || !classes.includes("ref")){
                clear_citations()
                $("body").toggleClass("citation-active")
           }
           
        }
    })

    // ---------------------
    // Side Nav
    // ---------------------
 
    // Add all heading items to nav bar
    var side_bar_elems_top = []
    var side_bar_elems = []
    $('h1,h2,h3').each(function(i){
        let in_item = false
        Object.values($(this).parents()).forEach((e)=>{
            if($(e).attr("class")){
                if($(e).attr("class").includes('accordion')){
                    in_item = true
                }
                if($(e).attr("class").includes('card')){
                    in_item = true
                }
            }

        })

        if($(this).is(":visible") && !in_item && !$("body").hasClass("front-page")){
            // For adding navigation hierarchy in future
            var level = null
            // switch ($(this)[0].nodeName){
            //     case "H1":
            //         var level = "level1"
            //         break
            //     case "H2":
            //         var level = "level2"
            //         break
            //     case "H3":
            //         var level = "level3"
            //         break
            //     default:
            //         var level = "level1"
            // }
            
            side_bar_elems.push($(this))
            side_bar_elems_top.push($(this).offset().top)
            let title = $(this).text()
            let active = i == 0 ? "active": ""
            let href = "#"+$(this).attr('id')
            
            $('.nav-tabs').append(`<li class="nav-item ">
            <a class="`+active+
            ` nav-link `+level+`" href="`+href+`" role="tab">`
            +title+`</a></li>`)
        }
        
    })
    // Manage clicks

    $('.nav-link').on('click', function(e){
        clear_nav_links()
        $(this).addClass('active')
    })

    // Change on scroll
    var current_index = 0
    $(window).on('wheel', function(e){
        if($(this).is(':animated')){return false}
        
        let top = $(window).scrollTop()
        for(var i=0; i< side_bar_elems.length; i++){
            var elem_top = side_bar_elems_top[i]
            if(i == 0){
                // Start
                if(top < elem_top){
                    current_index = activate_nav_link(i)
                }
            }else if(i == side_bar_elems.length-1){
                // End
                if(top > elem_top && top < $(document).height()){
                    current_index = activate_nav_link(i)
                }else if($(window).scrollTop() + $(window).height() == $(document).height()){
                    // Do something when at bottom of screen
                    // current_index = activate_nav_link(i)
                }
            }else{
                // Not start or end
                if(top > elem_top && top < side_bar_elems_top[i+1] ){
                    current_index = activate_nav_link(i)
                }
            }
        }
  
    })
});

function activate_nav_link(index){
    $('.nav').find('.nav-link').each(function(i){
        if(i==index){
            clear_nav_links()
            $(this).addClass("active")
        }
    })
}

function clear_nav_links(){
    $('.nav').find('.nav-link').each(function(e){
        $(this).removeClass("active")
    })
}

function clear_citations(){
    // Function to remove all citations on the page
    $('.ref').find('.refbody.active').toggleClass("active");
}