-- Determine the average glucose levels for women and men --

select 
gender, 
avg(avg_glucose_level) as average_glucose
FROM stroke_data
group by gender;

-- Determine the average age of stroke victims for women and men --

select 
gender, 
avg(age) as average_age 
FROM stroke_data
where stroke = 1
group by gender;

-- Determine which jobs have the highest counts of heart disease --

select 
coalesce(work_type, 'not listed') as jobs,
count(*) as heart_disease_rates
FROM stroke_data
WHERE heart_disease = 1
GROUP by jobs
ORDER by heart_disease_rates DESC;

-- Determine total counts of heart disease based on smoker status --

select 
coalesce(smoking_status, 'not listed') as smoker,
count(*) as heart_disease_rates
FROM stroke_data
WHERE heart_disease = 1
GROUP by smoker
ORDER by heart_disease_rates DESC;

-- Determine the average BMI of those diagnosed with hypertension --

SELECT
gender,
avg(bmi) as avg_bmi
FROM stroke_data
WHERE hypertension = 1
group by gender;

-- Determine total counts of each condition found in men and women --

SELECT 
 gender,
COUNT(CASE WHEN hypertension = 1 THEN 1 END) AS tot_hypertension,
COUNT(CASE WHEN heart_disease = 1 THEN 1 END) AS tot_heart_disease,
COUNT(CASE WHEN stroke = 1 THEN 1 END) AS tot_stroke
FROM stroke_data
GROUP BY gender;

-- Detrmine the risk percentage of stroke occuring in men and women

SELECT 
    gender,
    ROUND(
        SUM(CASE WHEN stroke = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS stroke_percentage
FROM stroke_data
GROUP BY gender;

