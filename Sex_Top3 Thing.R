library(tidyverse)
new <- lifts %>% 
  group_by(date, sex2) %>% 
  summarize(avg_top3 = mean(total_three),
            date = date)
new %>% 
  ggplot(aes(x = date, y = avg_top3, color = sex2)) + 
  labs(x = "Date", y = "Total Average 3 Lifts") +
  geom_line() +
  facet_wrap(~sex2)
