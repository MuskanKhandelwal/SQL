WITH tab1 AS(
SELECT category, product, SUM(spend) as total_spend, 
RANK() over(partition by category order by SUM(spend) desc) as r
FROM product_spend
where EXTRACT(YEAR FROM transaction_date) = 2022
group by category,product)

select category, product,total_spend from tab1
where r IN (1,2)
