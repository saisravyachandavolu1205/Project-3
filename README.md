# Project-3
This project investigates crime trends in Los Angeles from 2020 onward using real data provided by the LAPD. The goal is to identify temporal, categorical, and geographical crime patterns—especially changes due to the COVID-19 pandemic—using Python, R, and SQL.

**Key Objectives**
Analyze temporal crime patterns (before, during, and after COVID-19)
Examine changes in crime categories (e.g., robbery, assault, arson)
Explore geographic hotspots and arrest data across LA neighborhoods

** Dataset**
Source: L.A. City Crime Data
Records: ~800,000+
Fields used: Incident ID, Date, Crime Type, Location, City, Arrested

**Tools & Technologies**
Language	Purpose
Python (Jupyter Lab)	Data cleaning, preprocessing, visualization
R (RStudio)	High-quality statistical plots using ggplot2
MySQL	Data import, query, aggregation (via CrimeData table)

**Libraries Used**
Python: Pandas, Matplotlib, Seaborn
R: ggplot2, dplyr, tidyr
SQL: SELECT, GROUP BY, EXTRACT, JOIN

**Research Questions Addressed**
Temporal Trends: Did crime patterns shift during COVID-19?
Category Shifts: How did specific crimes (e.g., assaults, thefts) evolve?
Geographic Impact: Which neighborhoods saw crime surges or drops?

**Sample Results**
Crimes decreased during peak COVID-19 lockdowns but rose post-2022
Assault with deadly weapons remained the most frequent crime
Central LA had the highest concentration of incidents
Arrest distribution varied across precincts

**Visualizations**
Monthly & daily crime trends
Category distributions (before vs after COVID)
Victim age distributions
Geolocation heatmaps (Hexbin)
Crime category changes over time

 **Future Scope**
Expand to include gender, weapon use, or victim profiling
Integrate real-time updates via API
Build predictive models using ML
Apply same analysis to other U.S. cities
