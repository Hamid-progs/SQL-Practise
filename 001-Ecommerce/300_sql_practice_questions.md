# 300 SQL Practice Questions — E-Commerce Database

Database: `ecommerce_db` (see `ecommerce_full.sql` and `er_diagram.md`)
No answers included — these are meant for self-practice / interview prep, in the style of Data Analyst / BI interviews at companies like Google, Amazon, Microsoft, Meta, Uber, Walmart, and Airbnb.

---

## BASIC (100 Questions)
*Focus: SELECT, WHERE, ORDER BY, LIMIT, LIKE, IN, BETWEEN, DISTINCT, basic aggregates, simple JOINs*

1. Retrieve the first name, last name, and email of all customers.
2. List all products with a price greater than $100.
3. Find all orders with a status of 'Delivered'.
4. Show all customers who live in 'United States' (check the `country` column for the closest match your data uses).
5. Retrieve all products belonging to the 'Electronics' category.
6. List the top 10 most expensive products.
7. Find all employees hired after January 1, 2022.
8. Show all orders placed in the last 30 days relative to the most recent order date in the table.
9. List all suppliers located in the same city (pick any city present in your data).
10. Retrieve all coupons with a discount percentage greater than 20%.
11. Find all customers whose email contains 'gmail'.
12. List all products whose name starts with the letter 'S'.
13. Show all reviews with a rating of 5.
14. Retrieve all orders with a total amount between $100 and $500.
15. List all warehouses with a capacity greater than 20,000.
16. Find all employees with a salary above $80,000.
17. Show the 5 most recent orders.
18. List all distinct order statuses used in the Orders table.
19. Retrieve all distinct payment methods used in the Payments table.
20. Find all customers who signed up in the year 2023.
21. List all products that are currently inactive (`is_active = 0`).
22. Show all returns with a status of 'Approved'.
23. Retrieve all shippers and sort them alphabetically.
24. List the 20 lowest-priced products.
25. Find all suppliers with a rating above 4.5.
26. Show all departments along with their budget, sorted from highest to lowest.
27. List all products with no supplier (there shouldn't be any — verify this and explain why).
28. Retrieve all orders that used a coupon (`coupon_id IS NOT NULL`).
29. Find all customers with a NULL phone number, if any.
30. List all categories and their descriptions.
31. Show the total number of customers in the database.
32. Count how many products belong to each category (basic GROUP BY not required — use COUNT with WHERE for a single category).
33. Find the average price of all products.
34. Retrieve the maximum and minimum salary among employees.
35. Count the number of orders with status 'Cancelled'.
36. List all products priced exactly $49.99, $99.99, or $199.99 (use IN).
37. Find all orders placed between '2024-01-01' and '2024-06-30'.
38. Retrieve all employees who do not have a manager (`manager_id IS NULL`).
39. List all customers whose last name ends with 'son'.
40. Show all products sorted by price in descending order, limited to 15 rows.
41. Find all reviews left in the last 90 days (relative to the most recent review date).
42. Retrieve all orders with no assigned shipper.
43. List all coupons that are currently expired (`valid_to < CURRENT_DATE`).
44. Show the total number of products supplied by each of two specific suppliers (pick any two supplier IDs).
45. Find all warehouses located in a specific country (pick one present in your data).
46. Retrieve the 10 oldest customers by signup date.
47. List all order items with a quantity greater than 3.
48. Show all products with a price between $20 and $50, sorted by price ascending.
49. Find all employees whose job title contains the word 'Manager'.
50. Retrieve a distinct list of all cities where customers live.
51. Count the number of distinct countries suppliers operate from.
52. List all orders placed by a specific customer (pick any customer_id).
53. Find the total number of order items associated with a specific order.
54. Show all payments made using 'PayPal'.
55. Retrieve all products with a description that mentions 'quality'.
56. List the 5 highest-rated suppliers.
57. Find all returns that occurred within 7 days of the order date (approximate using date arithmetic).
58. Show all customers who are currently inactive (`is_active = 0`).
59. Retrieve the names of all employees working in the 'Sales' department (join required — treat as basic single-join practice).
60. List all products that belong to either the 'Books' or 'Toys' category (use IN with category names via a subquery or two separate lookups).
61. Find the number of employees in each department (simple GROUP BY).
62. Show the total revenue represented by all payments with status 'Completed'.
63. List order items where the subtotal exceeds $500.
64. Retrieve all products costing less than $10 to produce (`cost` column).
65. Find the customer with the earliest signup date.
66. Show the 3 most recently hired employees.
67. List all reviews containing the word 'damaged'.
68. Retrieve all orders with a total amount of exactly $0 (investigate if any exist and why).
69. Find the number of coupons that have never been used (`times_used = 0`).
70. Show all products from suppliers based in a specific country (pick one).
71. List the first 10 rows of the Order_Items table ordered by order_item_id.
72. Retrieve all employees earning between $50,000 and $90,000.
73. Find all customers without any reviews using a simple NOT IN subquery (basic version).
74. Show the total capacity across all warehouses.
75. List all products with 'Wireless' in the name.
76. Retrieve the number of orders that have not yet been delivered (status not equal to 'Delivered').
77. Find the youngest hire date among employees in a specific department.
78. Show all coupons valid during a specific month (pick any month/year).
79. List all customers sorted by last name, then first name.
80. Retrieve the top 5 warehouses by capacity.
81. Find the number of products per supplier for a single named supplier.
82. Show all orders that have more than one associated payment record.
83. List the distinct set of job titles used across all employees.
84. Retrieve the average rating given across all reviews.
85. Find all payments with an amount greater than $1,000.
86. Show all products that have never been restocked (`last_restock_date IS NULL`), if any exist.
87. List the number of returns per reason category (simple GROUP BY).
88. Retrieve all orders shipped by a specific shipper (pick any shipper_id).
89. Find the total number of reviews left for a specific product.
90. Show the 10 most expensive order items by subtotal.
91. List all customers who live in a country different from 'USA'.
92. Retrieve all products with prices rounded to the nearest whole dollar (use ROUND()).
93. Find the number of orders placed on weekends vs weekdays (use DAYOFWEEK or similar — simple filter version).
94. Show all employees along with their department_id, sorted by department_id.
95. List the 5 most recent payments.
96. Retrieve all suppliers whose name contains 'Inc' or 'LLC'.
97. Find the total number of distinct products that have at least one review.
98. Show all orders where the total_amount is greater than the average order total (simple subquery).
99. List all reviews with a rating below 3, sorted by review_date descending.
100. Retrieve the number of active vs inactive products using two separate COUNT queries.

---

## INTERMEDIATE (100 Questions)
*Focus: GROUP BY/HAVING, all JOIN types, subqueries, CASE, UNION, basic window functions, CTEs*

101. For each category, find the total number of products and the average price (GROUP BY + HAVING for categories with more than 10 products).
102. List the top 10 customers by total amount spent, using a JOIN between Customers and Orders.
103. Find all products that have never been ordered (LEFT JOIN with NULL check).
104. Show each employee alongside their manager's name using a self join on Employees.
105. Calculate the total revenue generated by each product category.
106. Find all customers who have placed more than 5 orders.
107. List all orders along with the customer's name and the shipper's name (multi-table JOIN).
108. Show the total number of order items per order, and filter for orders with more than 5 items.
109. Find the average order value per customer, and list the top 15.
110. Retrieve all suppliers who provide more than 20 products.
111. List each department along with the average salary of its employees.
112. Find all products where the price is more than double the cost (profit margin analysis).
113. Show the number of orders per month for the current year using GROUP BY on a date part.
114. Retrieve customers who have never left a review, using a LEFT JOIN.
115. Find the top 5 best-selling products by total quantity sold (JOIN Order_Items + Products, GROUP BY).
116. List all employees who manage at least 2 other employees.
117. Show the total refund amount issued per return reason.
118. Find all orders where the payment amount does not match the order's total_amount (data-quality style question).
119. Retrieve the number of reviews per rating value (1 through 5) using GROUP BY.
120. List all products along with their category name and supplier name in a single query.
121. Find the average number of items per order, broken down by order status.
122. Show all customers who have spent more than $2,000 in total, using GROUP BY + HAVING.
123. Retrieve the 3 most popular payment methods by transaction count.
124. Find all warehouses and the total inventory quantity stored in each.
125. List the categories with the highest average product rating (join Reviews → Products → Categories).
126. Show all orders and use a CASE statement to label them as 'High Value' (>$500), 'Medium Value' ($100–$500), or 'Low Value' (<$100).
127. Find employees who have processed more orders than the company average.
128. Retrieve a combined list of customer emails and supplier emails using UNION.
129. Find all products that are in the top 3 most expensive within their category (use a subquery per category).
130. Show the total number of orders and total revenue per shipper.
131. List customers who have used a coupon on at least one order, along with the coupon code.
132. Find the number of days between signup_date and each customer's first order (date difference).
133. Retrieve all products with below-average inventory quantity compared to their category.
134. Show a monthly breakdown of total revenue and total number of orders using GROUP BY on YEAR/MONTH.
135. Find all pairs of products frequently bought together in the same order (self join on Order_Items).
136. List the departments with total salary expense exceeding their budget.
137. Show the number of returns per product, sorted descending, limited to the top 10.
138. Find customers whose most recent order was cancelled.
139. Retrieve products with a rating average below 3 based on the Reviews table.
140. List all orders placed by customers from a specific city, along with total spent per customer.
141. Find the difference between total revenue and total refunded amount per month.
142. Show the top 5 suppliers by total revenue generated from their products.
143. Retrieve customers who have ordered from more than 3 different categories.
144. Find the percentage of orders that resulted in a return, using a subquery for total counts.
145. List all employees hired in the same year as their manager.
146. Show products that have a higher price than the average price in their category.
147. Find the number of unique customers served by each employee.
148. Retrieve the first order date and most recent order date for every customer.
149. List categories where total revenue exceeds $50,000.
150. Find the average time (in days) between order_date and payment_date.
151. Show all orders with more than one distinct product category represented in their order items.
152. Retrieve suppliers who have at least one product with zero inventory.
153. Find the top 3 categories by number of returns.
154. List employees who have never had an order assigned to them.
155. Show a running count of new customer signups per month using GROUP BY (non-window version).
156. Find all coupons that have been used more than 80% of their max_uses.
157. Retrieve the average discount percentage applied across all orders that used a coupon.
158. List products that appear in more than 50 distinct orders.
159. Find the customer with the highest number of distinct products purchased.
160. Show all reviews alongside the corresponding order date for that customer/product pair, if one exists (LEFT JOIN).
161. Retrieve departments with more than 5 employees earning above $60,000.
162. Find the total quantity sold and total revenue for each warehouse's products.
163. List all orders where the number of order items exceeds the customer's historical average.
164. Show the top 5 employees by total revenue of orders they processed.
165. Find products supplied by suppliers rated below 3.5 that still generated over $10,000 in revenue.
166. Retrieve a list of customers and, using CASE, classify them as 'New' (signed up this year) or 'Existing'.
167. List the number of orders per status, per year.
168. Find categories with fewer than 15 products but more than $20,000 in total revenue.
169. Show all products never restocked in the last 6 months.
170. Retrieve the average review rating per supplier (via Products join).
171. Find all customers who placed orders in at least 3 different calendar years.
172. List order items where the unit_price differs from the current product price (price-change detection).
173. Show the number of employees who report to each manager.
174. Find the top 5 products by number of distinct reviewers.
175. Retrieve all orders with total_amount in the top 10% of all orders (percentile-style, non-window version using a subquery).
176. List warehouses where total stored inventory value (quantity × price) exceeds $500,000.
177. Find customers who have both a 5-star and a 1-star review.
178. Show a UNION ALL combining top 5 products by revenue and top 5 products by units sold.
179. Retrieve the total number of orders that included at least one returned item.
180. List all suppliers along with the number of distinct categories their products span.
181. Find the average order total for orders with vs. without a coupon applied.
182. Show employees who joined within their first year and already manage other employees.
183. Retrieve products where cost is greater than 60% of price (thin margin products).
184. Find the top 3 cities by total customer count.
185. List all categories and the number of distinct suppliers contributing products to them.
186. Show the number of orders each coupon has been applied to, compared with its recorded times_used.
187. Find the average number of orders per customer, grouped by signup year.
188. Retrieve all products that have both positive (4–5) and negative (1–2) reviews.
189. List departments and the ratio of managers to non-managers.
190. Find the total value of pending payments across all orders.
191. Show all orders with total_amount greater than the maximum order total of a specific customer (correlated-style, simplified).
192. Retrieve the top 5 return reasons by total refund amount.
193. List customers who have never used a coupon despite placing 5+ orders.
194. Find products that are out of stock (quantity = 0) but were ordered in the last 30 days.
195. Show the average salary per job title across the company.
196. Retrieve orders with a status of 'Shipped' or 'Processing' that are older than 14 days.
197. Find all reviews left by customers who have also had at least one return.
198. List the number of unique products purchased by each customer, ranked descending, top 10 only.
199. Show categories with an average product price higher than the overall average product price.
200. Find all employees and, using CASE, label their tenure as 'New' (<1 year), 'Mid' (1–3 years), or 'Senior' (3+ years).

---

## ADVANCED (100 Questions)
*Focus: correlated subqueries, CTEs & recursive CTEs, window functions (ROW_NUMBER, RANK, DENSE_RANK, LAG, LEAD, NTILE), running totals, EXISTS/NOT EXISTS/ANY/ALL, transactions, complex analytics*

201. Using a window function, rank all products within each category by total revenue (RANK, no gaps handling required).
202. Calculate a running total of daily revenue across the entire order history using SUM() OVER (ORDER BY ...).
203. For each customer, use ROW_NUMBER() to identify their first, second, and third orders chronologically.
204. Use LAG() to calculate the number of days between each customer's consecutive orders.
205. Use LEAD() to find the next order date for every order, partitioned by customer.
206. Segment customers into 4 spending tiers using NTILE(4) based on total lifetime spend.
207. Write a recursive CTE to display the full management hierarchy starting from the CEO/top-level manager(s) down to individual contributors.
208. Find the second-highest priced product in each category using DENSE_RANK().
209. Calculate month-over-month revenue growth percentage using LAG() and window functions.
210. Identify each customer's most frequently purchased category using ROW_NUMBER() partitioned by customer, ordered by purchase count.
211. Find products whose total sales exceed the average total sales across ALL products, using a correlated subquery.
212. Use a correlated subquery to find employees who earn more than the average salary within their own department.
213. Find customers whose total spend is greater than ANY single order made by the top-spending customer.
214. Find products whose price is greater than ALL products in the 'Kids & Toys' category.
215. Use EXISTS to find all customers who have placed at least one order with total_amount over $1,000.
216. Use NOT EXISTS to find all products that have never appeared in a returned order item.
217. Write a CTE that computes customer lifetime value, then filter to customers in the top 5% using a window function percentile approach.
218. Calculate a 3-order moving average of order totals per customer using window functions.
219. Find the cumulative number of distinct customers acquired each month (running distinct count) using a CTE.
220. Identify products with declining month-over-month sales for at least 3 consecutive months.
221. Using window functions, find the top 3 highest-spending customers per country.
222. Write a query using RANK() to find each department's highest-paid employee(s), including ties.
223. Calculate the churn rate: the percentage of customers who ordered in one quarter but not the following quarter.
224. Use a recursive CTE to generate a calendar of all dates in a given year, then LEFT JOIN to Orders to find days with zero orders.
225. Find the median order total using window functions (PERCENT_RANK or NTILE-based approach).
226. Calculate each product's contribution to total category revenue as a percentage, using window functions.
227. Identify "at-risk" customers: those with no orders in the last 90 days but at least 3 orders total before that.
228. Use CASE + window functions to flag whether each order is a customer's first purchase ('New Customer Order') or a repeat purchase.
229. Find pairs of employees who share the same manager and were hired within 30 days of each other (self join + date logic).
230. Calculate the average days between order_date and the corresponding payment_date, per payment_method, using aggregate + JOIN.
231. Write a query to detect duplicate customer records based on matching first_name, last_name, and city (potential data-quality issue), using window functions to number duplicates.
232. Use ROW_NUMBER() partitioned by customer_id to find and "remove" (SELECT only) duplicate reviews left by the same customer for the same product.
233. Find the top-selling product per month for the entire order history using RANK() partitioned by month.
234. Calculate the retention rate: percentage of customers from a given signup month who placed a second order within 60 days.
235. Use a CTE chain (multiple CTEs) to compute: (1) order revenue, (2) rank customers by revenue, (3) select the top decile.
236. Find employees whose total processed order revenue is in the bottom 10% company-wide, using NTILE(10).
237. Write a query using window functions to compute each product's rank in sales for its category AND overall, side by side.
238. Identify the busiest warehouse by total quantity shipped, inferred via Order_Items joined through Products and Inventory.
239. Use EXISTS with a correlated subquery to find suppliers where ALL of their products are currently inactive.
240. Calculate a running total of returns (count and refund amount) per month using window functions.
241. Find the average order value trend using a 6-month rolling window (partition-free running average via ROWS BETWEEN).
242. Use a recursive CTE to find every employee under a specific manager, at any depth in the hierarchy.
243. Identify customers who upgraded their spending tier (using NTILE quartiles) between their first year and most recent year of activity.
244. Write a transaction-safe stored procedure (conceptually, in SQL) that inserts a new order and its order items, updates inventory, and rolls back if inventory would go negative.
245. Find the top 5 products by "review sentiment score" (average rating weighted by number of reviews) using a CTE.
246. Use window functions to calculate each customer's rank by total spend within their own signup cohort (year).
247. Find all orders placed within 1 hour of another order by the same customer (potential duplicate order detection) using self join or LAG on order_date.
248. Calculate the Pareto principle (80/20 rule): what percentage of customers generate 80% of total revenue? Use a running total with window functions.
249. Use a correlated subquery combined with ANY to find products priced higher than any product from a specific competitor category.
250. Write a query to compute each employee's year-over-year change in total order revenue processed, using LAG() partitioned by employee.
251. Identify seasonal trends: find which month(s) consistently show the highest order volume across all years in the dataset.
252. Use GROUPING SETS or multiple UNION ALL blocks to create a sales summary at the category level, supplier level, and grand total level.
253. Find customers who have a higher average order value than the overall company average AND have placed more than 3 orders (combined filtering).
254. Write a query using window functions to detect "gaps" in a customer's ordering pattern (periods with no orders longer than 6 months).
255. Calculate the inventory turnover ratio per product (units sold / average inventory) using a CTE joining Order_Items and Inventory.
256. Use RANK() and a self join to find, for each category, the price gap between the 1st and 2nd most expensive product.
257. Find all suppliers whose average product rating (via Reviews) is in the bottom quartile, using NTILE.
258. Write a recursive CTE to calculate the total team size (direct + indirect reports) for every manager.
259. Use window functions to identify each order's position in the customer's order sequence and flag every 5th order as "loyalty milestone."
260. Calculate the correlation between coupon usage and average order value using aggregate comparison (with vs without coupon, grouped).
261. Find customers who consistently order from the same category every time (100% category loyalty), using a CTE with COUNT DISTINCT.
262. Use EXISTS and NOT EXISTS together to find products that have been ordered but never reviewed.
263. Write a query to calculate the average fulfillment time (order_date to a 'Delivered' status change, approximated using order_date and payment_date as proxies) per shipper.
264. Use window functions to build a customer cohort retention table: percentage of each signup-month cohort still active in months 1, 2, 3, and 6 after signup.
265. Find the top 3 employees by year-over-year revenue growth using LAG() and percentage calculations.
266. Identify products where the standard deviation of order quantity is unusually high (using STDDEV() if supported, or variance approximation).
267. Write a CTE-based query to simulate a "recommendation engine": for a given customer, find the top 3 products purchased by other customers who share at least 2 common purchases with them.
268. Use ROW_NUMBER() to paginate through all orders, 50 per page, and retrieve page 5.
268b. (bonus) Rewrite the same pagination using LIMIT/OFFSET and compare performance considerations.
269. Find the longest streak (in months) of consecutive months with at least one order, per customer, using window functions and gaps-and-islands technique.
270. Calculate the marginal contribution of each product category to overall profit (revenue − cost) using a CTE.
271. Use a correlated subquery with ALL to find the supplier(s) whose products have consistently higher prices than every other supplier in the same category.
272. Write a query to detect "review bombing": products that received 5+ reviews of rating 1 within any single 7-day window.
273. Use window functions to find each customer's largest single order as a percentage of their total lifetime spend.
274. Build a CTE-based funnel analysis: how many customers signed up, how many placed at least 1 order, how many placed 2+ orders, how many became repeat reviewers.
275. Find employees who have never had a subordinate's order revenue exceed their own processed revenue (self join + aggregate comparison).
276. Use RANK() OVER (PARTITION BY category ORDER BY rating DESC) to build a "top rated product per category" leaderboard, breaking ties by review count.
277. Calculate the average number of days between a return being requested and being refunded, per return reason.
278. Use a recursive CTE combined with a running total to compute cumulative department budget usage against actual salary expense.
279. Write a query using NTILE(100) to calculate the percentile rank of every product by total revenue.
280. Find customers whose order frequency (orders per month since signup) is above the 90th percentile company-wide.
281. Use window functions to identify anomalous orders: those with a total_amount more than 3 standard deviations from that customer's average order value.
282. Write a query combining CTEs and EXISTS to find categories where more than 50% of products have at least one 1-star review.
283. Calculate the effective discount rate realized company-wide (total discount given / total pre-discount revenue) using coupon and order data.
284. Use LAG() and LEAD() together to classify each order as 'First', 'Middle', or 'Last' in a customer's order sequence.
285. Find the shortest path (fewest management levels) between any two employees using a recursive CTE (bonus graph-traversal style question).
286. Write a query to compute a weighted customer satisfaction score per product: (average rating × number of reviews) / (number of reviews + 10) — a Bayesian-average style ranking.
287. Use window functions to detect products that were top-3 best sellers in one quarter but dropped out of the top 10 in the next.
288. Calculate the employee-to-revenue efficiency ratio (total revenue processed / salary) and rank employees using RANK().
289. Write a CTE-based query simulating a basic A/B comparison: average order value for customers who used a coupon vs. those who didn't, segmented by signup cohort.
290. Use a recursive CTE to flatten the category hierarchy if categories had a parent_category_id (design and query for this hypothetical extension).
291. Find the "whale" customers: the smallest set of customers whose combined spend accounts for 50% of total revenue, using a running total CTE.
292. Use window functions to compute each warehouse's inventory turnover rank compared to all other warehouses.
293. Write a transaction example (BEGIN, multiple UPDATEs/INSERTs, COMMIT/ROLLBACK) simulating processing a return: update Returns, restock Inventory, and adjust Payments status atomically.
294. Use DENSE_RANK() to assign loyalty tiers (Platinum/Gold/Silver/Bronze) based on quartiles of lifetime spend, then compare with the NTILE-based approach from question 206.
295. Find suppliers whose products' average rating declined over the last 4 quarters using LAG() on quarterly aggregates.
296. Write a query to identify circular or invalid manager references in the Employees table (data integrity check using a recursive CTE with a depth limit).
297. Calculate each product's "days of inventory remaining" based on its trailing 30-day average daily sales rate.
298. Use window functions to build a leaderboard of the top 10 (customer, product) pairs by total quantity purchased, with ties broken by first purchase date.
299. Write a comprehensive CTE-based executive summary query: total revenue, total orders, total customers, average order value, and month-over-month growth — all in one result set using multiple chained CTEs.
300. Design and write a query (using any combination of the techniques above) to identify the single most valuable customer segment for a targeted marketing campaign, justifying the segment definition through your SQL logic (e.g., high spend + high frequency + recent activity — an RFM-style analysis).

---

*Tip: Solve these roughly in order — basic questions build the muscle memory for filtering and joining, intermediate questions build aggregation and multi-table fluency, and advanced questions mirror real interview whiteboard/take-home problems at top tech companies.*
