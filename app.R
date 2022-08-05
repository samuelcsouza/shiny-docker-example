library(shiny)
library(shinydashboard)
library(waiter)

sidebar <- dashboardSidebar(
  
  waiter::use_waiter(),
  
  waiter::waiter_show_on_load(
    tagList(
      waiter::spin_fading_circles(), 
      span("Loading...", style = "font-size: 18px;")
    )
  ),
  
  sidebarMenu(
    
    menuItem('Home', tabName = 'home', icon = icon("home"))
    
  )
)

ui <- dashboardPage(
  
  skin = 'blue',
  
  title = 'Shiny & Docker', 
  
  dashboardHeader(), 
  
  sidebar,
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "home",
              
              # Home Page
              fluidPage(
                
                div(align = 'center',
                    img(src = 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg',
                        width  = "300px",
                        height = "300px"),
                    
                    
                    h1(Sys.getenv('PROJECT_NAME')),
                    
                    h3('Operating System Information'),
                    
                    br(), br(),
                    
                    dataTableOutput('sys_info')
                ),
                
              )
      )
    )
  )
)

server <- function(input, output, session) {
  
  Sys.sleep(1)
  
  output$sys_info <- renderDataTable({
    
    
    table <- as.data.frame(Sys.info())
    
    table$info <- rownames(table)
    
    colnames(table) <- c('Description', 'Information')
    rownames(table) <- NULL
    
    data.frame('Information' = table$`Information`, 
               'Description' = table$`Description`)
    
  }, options = list(searching = FALSE, ordering = FALSE, paging = FALSE))
  
  waiter::waiter_hide()
  
}

shinyApp(ui, server)