#load libraries
library(tidyverse)

#load goodreads data
goodreads_data <- read.csv("goodreads_data.csv", stringsAsFactors = FALSE)

#view the first few rows
head(goodreads_data)

#check structure of the dataset
str(goodreads_data)

#summary statistics
summary(goodreads_data)

#check for missing values
colSums(is.na(goodreads_data))

#count of books by author
goodreads_data %>%
  count(Author, sort = TRUE)

#distribution of ratings
ggplot(goodreads_data, aes(x = My.Rating)) +
  geom_bar(fill = "blue") +
  labs(title = "Distribution of My Ratings",
       x = "Rating",
       y = "Count")

#top shelves
goodreads_data %>%
  separate_rows(Bookshelves, sep = ",") %>%
  count(Bookshelves, sort = TRUE) %>%
  head(10)

#GoodreadsR package: function documentation

This Markdown file documents the main functions developed for my final project R package, `GoodreadsR`, which helps users analyze their Goodreads reading data.

##`import_goodreads(file)`
**Purpose:**  
  This function reads and cleans the Goodreads CSV export file.

**Inputs:**
  - `file`: A character string specifying the path to the Goodreads CSV file.

**Outputs:**
  - A cleaned data frame ready for analysis.

**Example:**
  ```r
clean_data <- import_goodreads("goodreads_data.csv")

##`summarize_reading(data)`
**Purpose:**  
  Generates summary statistics for books read, including average rating, total pages, and number of books.

**Inputs:**
  - `data`: A data frame produced by `import_goodreads()`.

**Outputs:**
  - A summary table of key statistics.

**Example:**
  ```r
summary_table <- summarize_reading(clean_data)

##`plot_ratings_distribution(data)`
**Purpose:**  
  Visualizes the distribution of user ratings.

**Inputs:**
  - `data`: A data frame containing user ratings.

**Outputs:**
  - A bar plot displaying the count of each rating.

**Example:**
  ```r
plot_ratings_distribution(clean_data)

##`top_authors(data, n = 10)`
**Purpose:**  
  Identifies the most-read authors.

**Inputs:**
  - `data`: A Goodreads data frame.
- `n`: Number of top authors to return. Default is 10.

**Outputs:**
  - A data frame of top authors and book counts.

**Example:**
  ```r
top_10 <- top_authors(clean_data)

##`bookshelves_summary(data)`
**Purpose:**  
  Analyzes the most common user bookshelves (tags).

**Inputs:**
  - `data`: A Goodreads data frame.

**Outputs:**
  - A data frame of shelf names and their frequency.

**Example:**
  ```r
bookshelf_summary <- bookshelves_summary(clean_data)

##`track_reading_goals(data, year)`
**Purpose:**  
  Tracks progress toward yearly reading goals.

**Inputs:**
  - `data`: A Goodreads data frame.
- `year`: A four-digit year.

**Outputs:**
  - A plot showing reading goal progress.

**Example:**
  ```r
track_reading_goals(clean_data, 2024)

##`visualize_genres(data)`
**Purpose:**  
  Creates a graphical representation of genre preferences.

**Inputs:**
  - `data`: A Goodreads data frame.

**Outputs:**
  - A genre distribution plot.

**Example:**
  ```r
visualize_genres(clean_data)

##`compute_reading_trends(data)`
**Purpose:**  
  Calculates trends in reading habits over time.

**Inputs:**
  - `data`: A Goodreads data frame.

**Outputs:**
  - A line plot showing reading trends by year.

**Example:**
  ```r
compute_reading_trends(clean_data)
