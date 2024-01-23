# Top 5 users who have liked restaurants the most 

SELECT
    user_id,
    COUNT(res_id) AS like_count
FROM
    like_res
GROUP BY
    user_id
ORDER BY
    like_count DESC
LIMIT 5;
# Top 2 restaurant which have the most users like 
SELECT
    r.res_id,
    r.res_name,
    COUNT(lr.like_res_id) AS like_count
FROM
    restaurants r
    LEFT JOIN like_res lr ON r.res_id = lr.res_id
GROUP BY
    r.res_id,
    r.res_name
ORDER BY
    like_count DESC
LIMIT
    2;

# user who have the most orders
SELECT
    u.user_id,
    u.full_name,
    u.email,
    COUNT(o.order_id) AS total_orders
FROM
    users u
    JOIN orders o ON u.user_id = o.user_id
GROUP BY
    u.user_id
ORDER BY
    total_orders DESC
LIMIT
    1;

# Find user who are not active in the system
SELECT
    u.user_id,
    u.full_name,
    u.email
FROM
    users u
    LEFT JOIN orders o ON u.user_id = o.user_id
    LEFT JOIN like_res lr ON u.user_id = lr.user_id
    LEFT JOIN rate_res rr ON u.user_id = rr.user_id
WHERE
    o.order_id IS NULL
    AND lr.like_res_id IS NULL
    AND rr.rate_res_id IS NULL;