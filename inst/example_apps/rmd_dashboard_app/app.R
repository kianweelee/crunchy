library(crunchy)

ui <- fluidPage(
     uiOutput("dashboard")
)

server <- function(input, output, session) {
    user <- shinyUser()
    output$dashboard <- renderUI({
        current_user <- email(user())
        if (grepl("acme.com$", current_user)) {
            includeHTML("acme_dashboard.html")
        } else if (grepl("globex.com$", current_user)) {
            includeHTML("globex_dashboard.html")
        } else {
            h1("You do not have access to this dashboard, please contact your dataset administrator.")
        }
    })
}

# Run the application
shinyApp(ui = ui, server = server)
