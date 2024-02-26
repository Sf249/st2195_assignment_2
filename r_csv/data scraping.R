# Load the cirrect library
library(rvest)

# URL Wikipedia page
url <- "https://en.wikipedia.org/wiki/Comma-separated_values"

# Read HTML 
html <- read_html(url)

# Scrape the car example table containing the CSV 
csv_table <- html %>%
  html_nodes("table.wikitable") %>%
  .[[1]] %>%
  html_table(fill = TRUE)

# Convert the scraped table to a data frame
csv_data <- data.frame(csv_table)

# Specify the file path for saving the CSV file
file_path <- "r_csv/csv_example_data.csv"

# Save the resulting output as a CSV file
write.csv(csv_data, file = file_path, row.names = FALSE)

# Print message
cat("CSV example data has been scraped and saved in 'r_csv/csv_example_data.csv'.\n")
