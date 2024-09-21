-- DATA CLEANING

SELECT *
FROM layoffs;

-- 1. Remove Duplicates
-- 2. Standardized the data
-- 3. Null Values or Blank Values
-- 4. Remove Any Columns

CREATE TABLE layoffs_staging3
LIKE layoffs;

SELECT *
FROM layoffs_staging3;

INSERT layoffs_staging3
SELECT *
FROM layoffs;

SELECT *,
ROW_NUMBER() OVER(
	PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num
FROM layoffs_staging3;

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging3
)
DELETE 
FROM duplicate_cte
WHERE row_num > 1;

SELECT *
FROM layoffs_staging3
WHERE company = 'Casper';

CREATE TABLE `layoffs_staging4` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * 
FROM layoffs_staging4
WHERE row_num > 1;

INSERT INTO layoffs_staging4
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging3;

DELETE  
FROM layoffs_staging4
WHERE row_num > 1;

SELECT * 
FROM layoffs_staging4
WHERE row_num > 1;

SELECT * 
FROM layoffs_staging4;

-- Standardizing Data

SELECT company, TRIM(company)
FROM layoffs_staging4;

UPDATE layoffs_staging4
SET company = TRIM(company);

SELECT DISTINCT industry
FROM layoffs_staging4
ORDER BY 1;