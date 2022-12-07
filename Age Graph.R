age_lifting <- lifts %>% 
  ggplot(aes(x = age, y = total_three)) + 
  geom_col(stat = "count", fill = "salmon") 

ggplotly(age_lifting)

summary(lifts$total_three)


lifts %>%
  ggplot(aes(x = age, y = total_three)) + 
  geom_point(stat = "identity") +
  coord_flip()


plot <- lifts %>%
  ggplot() + 
  geom_col(aes(x = age_class, y = total_three)) 

ggplotly(plot)



#######
age_lifting_new <- lifts %>% 
  group_by(age) %>% 
  summarize(mean = mean(total_three),
            age = age,
            age_class = age_class) %>% 
  filter(age != 0.5)

age_lifting_new <- age_lifting_new %>%
  distinct(age, .keep_all = TRUE)

age_lifting_new %>% 
  ggplot(aes(x = age, y = mean)) + 
  geom_col(stat = "count", fill = "salmon") +
  labs (x = "Age of Competitor at Competition", y = "Average Total of Top 3 Lifts")


plot <- age_lifting_new %>% 
  ggplot(aes(x = age_class, y = mean)) + 
  geom_bar(stat = "identity", fill = "salmon") +
  coord_flip()

ggplotly(plot)
