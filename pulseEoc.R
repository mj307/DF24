eoc <- read.csv('checkpoints_eoc.csv')
pulse <- read.csv('checkpoints_pulse.csv')
install.packages("dplyr")
install.packages("tidyr")
install.packages('ggplot2')
library(dplyr)
library(tidyr)
library(ggplot2)

new_eoc <- eoc %>%
  filter(book == 'College / Statistics and Data Science (ABC)') %>%
  mutate(hai=(n_correct/n_possible))%>%
  group_by(chapter_number)%>%
  summarize(mean_hai = mean(hai,na.rm=TRUE))

new_pulse <- pulse %>%
  filter(book == 'College / Statistics and Data Science (ABC)') %>%
  filter(construct != 'Cost') %>%
  group_by(chapter_number) %>%
  summarize(mean_response = mean(response,na.rm=TRUE))

ggplot(new_pulse, aes(x = chapter_number, y = mean_response)) +  
  geom_line() +                     
  labs(x = "Chapter Number",          
       y = "Responses",
       title = "Relationship between Chapter Number and Responses")

top_resoponse_chapters <- new_pulse %>%
  arrange(desc(mean_response)) %>%
  head(5)

low_response_chapters <- new_pulse %>%
  arrange((mean_response)) %>%
  head(5)

full_pulse_table <- new_pulse %>%
  arrange((mean_response)) 


ggplot(new_eoc, aes(x = chapter_number, y = mean_hai)) + 
  geom_line() + labs(x = "Chapter Number",          
                     y = "Exam %",
                     title = "Relationship between Chpater Number and Assesment Grades") + theme_minimal()

full_eoc_table <- new_eoc %>%
  arrange(desc(mean_hai))

top_eoc_chapters <- new_eoc %>%
  arrange(desc(mean_hai)) %>%
  head(5)

low_eoc_chapters <- new_eoc %>%
  arrange((mean_hai)) %>%
  head(5)