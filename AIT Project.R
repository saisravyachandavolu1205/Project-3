crime_data <- read.csv("Crime_Data_from_2020_to_Present.csv");

# Basic exploration
summary(crime_data)
head(crime_data)

# Retrieve column names of the dataframe
column_names <- colnames(crime_data)

# Print the column names
print(column_names)

# Load the necessary library for data manipulation
library(dplyr)

# Remove unnecessary columns
crime_data <- select(crime_data, -c(Crm.Cd.1, Crm.Cd.2, Crm.Cd.3, Crm.Cd.4))

# Convert relevant columns to appropriate data types
crime_data$Date.Rptd <- as.Date(crime_data$Date.Rptd, format="%m/%d/%Y %I:%M:%S %p")
crime_data$DATE.OCC <- as.Date(crime_data$DATE.OCC, format="%m/%d/%Y %I:%M:%S %p")
crime_data$AREA <- as.factor(crime_data$AREA)
crime_data$Part.1.2 <- as.factor(crime_data$Part.1.2)
crime_data$Crm.Cd <- as.factor(crime_data$Crm.Cd)
crime_data$Vict.Sex <- as.factor(crime_data$Vict.Sex)
crime_data$Vict.Descent <- as.factor(crime_data$Vict.Descent)
crime_data$Premis.Cd <- as.factor(crime_data$Premis.Cd)
crime_data$Weapon.Used.Cd <- as.factor(crime_data$Weapon.Used.Cd)
crime_data$Status <- as.factor(crime_data$Status)

# Remove rows with missing values
crime_data <- na.omit(crime_data)

# Display the cleaned dataset
head(crime_data)

# Univariate analysis of Victim Age
hist(crime_data$Vict.Age, main="Distribution of Victim Age", xlab="Age", col="skyblue")

# Univariate analysis of Crime Categories
barplot(table(crime_data$Crm.Cd.Desc), col='skyblue', main='Crime Categories Distribution', xlab='Crime Category', ylab='Number of Crimes')

#+ fig.width=12, fig.height=12
# Scatterplot between Victim Age and Time of Occurrence
plot(crime_data$Vict.Age, crime_data$TIME.OCC, main="Scatterplot: Victim Age vs Time of Occurrence", xlab="Victim Age", ylab="Time of Occurrence", col="blue")

# Correlation matrix for selected numeric columns
numeric_cols <- select_if(crime_data, is.numeric)
cor_matrix <- cor(numeric_cols)

# Print correlation matrix
print(cor_matrix)

# Research question 1 Create a time series plot of monthly crime counts
library(ggplot2)
crime_data$Month_Year <- format(crime_data$DATE.OCC, "%Y-%m")

# Summary statistics for DATE OCC
summary(crime_data$DATE.OCC)

#+ fig.width=12, fig.height=12
ggplot(crime_data, aes(y=Month_Year)) +
  geom_bar(stat="count", fill="skyblue") +
  labs(title="Monthly Crime Trends", x="Number of crimes", y="Year-Month") +
  theme_minimal()

# Extract Year and Month from DATE OCC
crime_data$Year <- format(crime_data$DATE.OCC, "%Y")
crime_data$Month <- format(crime_data$DATE.OCC, "%m")

# Time series plot of monthly crime counts over years
library(tidyr)
library(dplyr)
crime_data %>%
  group_by(Year, Month) %>%
  summarise(Count = n()) %>%
  ggplot(aes(x = as.Date(paste(Year, Month, "01", sep="-")), y = Count)) +
  geom_line(color="skyblue") +
  labs(title="Monthly Crime Trends Over Years", x="Date", y="Number of Crimes") +
  theme_minimal()

# Research question 2 Summary statistics for Crime Categories
# Barplot for Crime Categories
#+ fig.width=12, fig.height=20
ggplot(crime_data, aes(y=Crm.Cd.Desc)) +
  geom_bar(fill="skyblue") +
  labs(title="Crime Categories Distribution", x="Number of Crimes", y="Crime Category") 

# Stacked barplot of changes in crime categories over time
crime_data %>%
  group_by(Year, Crm.Cd.Desc) %>%
  summarise(Count = n()) %>%
  #+ fig.width=30, fig.height=6
  ggplot(aes(x = as.factor(Year), y = Count, fill = Crm.Cd.Desc)) +
  geom_bar(stat="identity") +
  labs(title="Changes in Crime Categories Over Time", x="Year", y="Number of Crimes", fill="Crime Category") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
# The image here is visible only little because of the plotter size ratio. 
# To see the whole plot 4:2 image ratio is needed and image dimensions as 4000x2000.
# The image is not suitable for compile report, the original image is included in research paper report.

# Top 10 crime categories by count
top_categories <- crime_data %>%
  group_by(Year, Crm.Cd.Desc) %>%
  summarise(Count = n()) %>%
  arrange(desc(Count)) %>%
  slice_head(n = 10)

# Stacked barplot of changes in top 10 crime categories over time
#+ fig.width=12, fig.height=12
ggplot(top_categories, aes(x = as.factor(Year), y = Count, fill = Crm.Cd.Desc)) +
  geom_bar(stat="identity") +
  labs(title="Top 10 Changes in Crime Categories Over Time", x="Year", y="Number of Crimes", fill="Crime Category") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# Scatterplot of crime locations
#+ fig.width=12, fig.height=6
ggplot(crime_data, aes(x=LON, y=LAT)) +
  geom_point(alpha=0.5, color="red") +
  labs(title="Crime Locations in Los Angeles", x="Longitude", y="Latitude") +
  theme_minimal()




