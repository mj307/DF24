library(shiny)
library(shinyjs)

ui <- fluidPage(
  useShinyjs(),  # Initialize shinyjs
  
  tags$head(
    tags$style(HTML("
      @import url('https://fonts.googleapis.com/css2?family=League+Spartan&display=swap');

      body, html, .container, .container-fluid {
        width: 100%;
        height: 750px;
        margin: 0;
        padding: 0;
      }

      body {
        font-family: 'League Spartan', sans-serif; /* Use the custom font */
        font-size: 26px; /* Adjust the font size as needed */
        background: linear-gradient(to bottom, #B8E2F2, #ede2f0, #ffffff); /* Gradient background */
      }

      video {
        display: block;
        margin: 0 auto;
        width: 100%;
        max-height: 750px;
      }
    "))
  ),
  div(class = "container-fluid",
      div(id = "page1", style = "display:block;",
          tags$video(src = "videos\\Purple animated tech festival promo instagram post.mp4", type = "video/mp4", controls = TRUE),
          br(),
          actionButton("next_page", "Next Page", style = "margin-top: 20px;")
      ),
      div(id = "page2", style = "display:none;",
          h2("Introduction"),
          p(""),
          actionButton("next_page2", "Next Page", style = "margin-top: 20px;")
      ),
      div(id = "page3", style = "display:none;",
          h2("Analysis"),
          p(""),
          actionButton("next_page3", "Next Page", style = "margin-top: 20px;")
      ),
      div(id = "page4", style = "display:none;",
          h2("Conclusion"),
          p(""),
          actionButton("back_page", "Back", style = "margin-top: 20px;")
      )
  ),
  tags$script("
    $(document).ready(function() {
      $('#next_page').click(function() {
        $('#page1').hide();
        $('#page2').show();
      });

      $('#next_page2').click(function() {
        $('#page2').hide();
        $('#page3').show();
      });

      $('#next_page3').click(function() {
        $('#page3').hide();
        $('#page4').show();
      });

      $('#back_page').click(function() {
        $('#page4').hide();
        $('#page3').show();
      });
    });
  ")
)

shinyApp(ui, server = function(input, output) {})

