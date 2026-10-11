# Quick Commerce Sales & Delivery Analytics (MySQL + Power BI)

Analysis of 30,000 simulated quick-commerce orders across 6 Indian cities
to find what drives revenue and how delivery speed affects customer ratings.

## Business questions
1. Which categories and cities generate the most revenue?
2. Does faster delivery lead to better ratings?
3. Which cities need operational improvement?

## Tools
| Tool | Used for |
|---|---|
| MySQL 8 | Schema design, data generation, CTEs, window functions (LAG, RANK), views |
| Power BI | Data modelling, date table, DAX measures, dashboard design |

## Repository structure
| Path | Description |
|---|---|
| sql/quickcommerce_project.sql | Tables, data generation, view and 6 analysis queries,update query,result |
| powerbi/QuickCommerce_Dashboard.pbix | Power BI report |
| images/dashboard.png | Dashboard screenshot 
| data/vw_sales.csv | Exported view used in Power BI |

## DAX measures
Total Revenue, Total Orders, Avg Order Value, Avg Delivery Min,
Avg Rating, Revenue Last Month, MoM Growth %

## Key insights
1. Orders delivered in under 15 minutes average a 4.5 rating,
   against 2.0 for orders over 25 minutes.
2. Mumbai is the biggest market (Rs 22.9L revenue, 7,486 orders) but has
   the slowest delivery (27.9 min) and the lowest rating (2.80).
3. Pune is the smallest market but has the fastest delivery (18.1 min)
   and the best rating (3.81).
4. Staples earn Rs 3.24M, about 37% of total revenue.

## Recommendation
Add delivery capacity in Mumbai and Delhi to reduce orders over
25 minutes and lift ratings in the two largest markets.

## How to run
1. Run `sql/quickcommerce_project.sql` in MySQL Workbench (MySQL 8+).
2. Connect Power BI to MySQL, or load `data/vw_sales.csv`.
3. Open `powerbi/QuickCommerce_Dashboard.pbix` and point the source to your data.

## Note
The dataset is synthetic, generated with SQL for learning purposes.

## Author
Jayalakshmi S | [LinkedIn](https://linkedin.com/in/jaya-lakshmi-7679732)
