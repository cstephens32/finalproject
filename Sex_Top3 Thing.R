library(tidyverse)
library(ggthemes)
new <- lifts %>% 
  group_by(date, sex2) %>% 
  summarize(avg_top3 = mean(total_three),
            date = date) %>%
  distinct(sex2, .keep_all = TRUE)

new %>% 
  ggplot(aes(x = date, y = avg_top3, color = sex2)) + 
  labs(x = "Date", y = "Total Average 3 Lifts") +
  geom_point() +
  geom_jitter() +
  stat_smooth() +
  facet_wrap(~sex2) +
  theme_few() +
  labs(y = "Average of 3 Lifts",
       title = "Average of 3 Lifts Over Time by Sex") +
    guides(color = guide_legend(title = "Sex"))
