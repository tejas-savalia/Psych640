#Reading in the data

doctor_data <- read.csv(file.choose(), header=TRUE)

#Reads in a data frame

#number of doctor visits affecting health score
#Access to healthcare affecting health score

#deapendent variable: health status
#imdependent variable(s) access to health care and number of doctor visits
#higher health score is health

num_visits = doctor_data[2]

num_children = doctor_data[3]

#greater access score is better access. Availibility of health services
access = doctor_data[4]

#Higher health score is poorer health
health_score = doctor_data[5]

#All variables are data frames


#Calculate summaries for these variables
summary_health_score = summary(health_score)
summary_access = summary(access)
summary_num_visits = summary(num_vists)
summary_num_children = summary(num_children)


#boxplots
par(mfrow=c(1, 1))
boxplot(health_score, ylab='Health Score')
boxplot(access, ylab='Access to health')
boxplot(num_visits, 'Number of Visits')
boxplot(num_children, 'Number of Children')

#histograms
par(mfrpw=c(1, 1))
hist(health_score$health, xlab = "Health Score", main = "Health Scores", col = "grey")
hist(access$access, xlab = "Access to Healthcare", main = "Access to Healthcare", col = "grey")
hist(num_visits$doctor, xlab = "Number of Doctor Visits", main = "Number of Visits", col = "grey")
hist(num_children$children, xlab = "Number of Children", main = "Number of Children", col = "grey")

#standard Deviations

sd(health_score$health)
sd(access$access)
sd(num_children$children)
sd(num_visits$doctor)


#health score below 0
sum(health_score$health > 0)

barplot(c(sum(health_score$health < 0), sum(health_score$health > 0)
), col = c("blue", "red"))



#Distribution shapes
#Normality: qq plots

qqnorm(health_score$health, main = "Health Scores")
qqnorm(access$access, main = "Access to healthcare")
qqnorm(num_children$children, main = "Number of Children")
qqnorm(num_visits$doctor, main = "Number of Visits")


#Z-scores
#Calculate z scores for two groups; one with data points having 1 child, 
#the second one with datapoints having 2 children

children_1 = doctor_data[doctor_data$children == 1,]

children_2 = doctor_data[doctor_data$children == 2,]

#Control the number of visits to the doctor to compare. Say we're comparing for those
#patients who visit the doctor 5 times.
#Extract the rows for each group with 5 doctor visits

visits_child_1 = children_1[children_1$doctor == 5,]
#Rows 14, 138 and 227 satisfy this condition

visits_child_2 = children_2[children_2$doctor == 5,]
#Row 189 satisfies this condition

#find their z-scores
z_health_child_1 = (doctor_data$health[227] - mean(children_1$health))/sd(children_1$health)
z_health_child_2 = (doctor_data$health[189] - mean(children_2$health))/sd(children_1$health)


z_health_child_1
z_health_child_2


##Skewness


