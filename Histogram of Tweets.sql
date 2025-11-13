with buck as(
SELECT user_id, COUNT(user_id) AS tweet_bucket  FROM tweets
WHERE EXTRACT(YEAR FROM tweet_date) = 2022
group by user_id)

select tweet_bucket, COUNT(user_id) AS users_num
from buck
group by tweet_bucket
