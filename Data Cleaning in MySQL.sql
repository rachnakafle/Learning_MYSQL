-- DATA CLEANING

SELECT * 
FROM layoffs;

-- 1. Remove Duplicates
-- 2. Standardized the data
-- 3. Null Values or Blank Values
-- 4. Remove Any Columns

CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT *,
ROW_NUMBER() OVER( 
PARTITION BY Company, Industry, Total_laid_off, Percentage_laid_off, `date`) AS row_num
FROM layoffs_staging;

WITH duplicate_cte AS 
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

SELECT *
FROM layoffs_staging
WHERE company = 'Casper';
-- INSERT layoffs_staging
SELECT *
FROM layoffs;


