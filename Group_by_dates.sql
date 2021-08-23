/* Write a query that counts the number of companies acquired within 3 years, 5 years, and 10 years 
of being founded (in 3 separate columns). Include a column for total companies acquired as well.
Group by category and limit to only rows with a founding date. */




 select  count(companies.permalink) as "Total_companies",
         count(case when now() - companies.founded_at_clean::timestamp > '10 years' then companies.permalink 
              else null
              end) as "10 years_count",
        count(case when now() - companies.founded_at_clean::timestamp > '5 years' then companies.permalink 
              else null
              end) as "5 years_count",
        count(case when now() - companies.founded_at_clean::timestamp > '3 years' then companies.permalink 
              else null
              end) as "3 years_count"
   from tutorial.crunchbase_companies_clean_date companies
  where companies.founded_at_clean is not null
