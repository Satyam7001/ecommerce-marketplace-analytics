# E-commerce Marketplace Analytics: Returns, Profitability \& Retention

An end-to-end data analytics project on a synthetic online-marketplace dataset (7 related tables, around 30,000 orders).
I cleaned the messy data in Python, answered 8 business questions with Python and SQL, and built a Power BI dashboard.

>Note: the data is synthetic (generated for practice by Claude AI). It is not real company data.

\---

## 1\. Business Problem

An online marketplace has strong sales growth, but management has limited visibility into profitability, product quality and customer loyalty.
This project finds:

* which categories and products create the most **profit**, not just revenue
* which products, sellers and reasons cause **returns** and low ratings
* whether customers **come back**
* which months need **more stock and planning**

\---

## 2\. Dataset

|Table|What it contains|Main columns|
|-|-|-|
|customers|Customer details|customer\_id, gender, age, state, city, signup\_date|
|orders|One row per order|order\_id, customer\_id, order\_date, product\_id, seller\_id, quantity, unit\_price, discount\_pct, sales\_amount, cost\_amount, profit, order\_status, shipping\_days|
|products|Product details|product\_id, product\_name, category, sub\_category, unit\_price, unit\_cost, seller\_id, quality\_score|
|sellers|Seller details|seller\_id, seller\_name, seller\_state, seller\_rating, join\_date|
|payments|Payment per order|payment\_id, order\_id, payment\_method, payment\_amount, payment\_status|
|reviews|Customer ratings|review\_id, order\_id, product\_id, customer\_id, rating, review\_date, review\_text|
|returns|Returned orders|return\_id, order\_id, product\_id, return\_date, return\_reason, refund\_amount|

\---

## 3\. Tools

Python (Pandas, NumPy, Matplotlib, Seaborn), SQL, Power BI, Jupyter Notebook

\---

## 4\. Workflow

1. **Data cleaning** (Python / Pandas)
2. **Data validation** (key, orphan-record, date and business-logic checks)
3. **Analysis** (Python notebooks + SQL queries)
4. **Dashboard** (Power BI)
5. **Insights and recommendations**

### Data cleaning log

|Problem found|Where|How I fixed it|
|-|-|-|
|Duplicate rows|All tables|Removed duplicates by row and by ID|
|Missing values|\[ADD columns you fixed]|Rebuilt from related columns where possible, otherwise median or "Unknown"|
|Mixed date formats|All date columns|Parsed each format explicitly (YYYY-MM-DD, DD/MM/YYYY, Mon DD, YYYY)|
|Inconsistent text|Category, state, status, payment method, reason|Stripped spaces, fixed case, mapped typos to one standard value|
|Invalid values|Quantity, age, rating, price, cost, shipping days|Marked as missing and rebuilt or filled|
|Orphan keys|Orders, payments, reviews, returns|Set to missing or removed rows with no matching order|



## 5\. Business Questions and Key Findings

|#|Question|Key finding|
|-|-|-|
|1|Which categories earn the most revenue and profit?|\[Electronics Earn most, Revenue = 87.1M \&, its Revenue share is 62.3% But Profit margin is only 15.4%, Fashion has Highest profit Margin with 39.2% then Beauty with 39.1%, then Toys with 36.6% then Home \& Kitchen 29.8%, Sports 29.1%, Books 20.5%, Grocery 6.1%]|
|2|Which products sell a lot but are rated poorly?|\[We have 29 risky products,  2 of them are Toys item 419{has 3625 orders 3.34 rating}, Fashion item 88 {1300 orders 3.46 rating}.<br /><br />And we have 7 from fashion \& books, 5 from electronics, 4 from sports, 3 from toys, 2 from home \& Kitchen and 1 from Grocery]|
|3|Which sellers have high return rates?|Highest seller return rate was \[S0070] with 12.1% against an average of 7.5%|
|4|Why do customers return products?|Defective (27.6%) and Not As Described (24.2%) make up about 52% of returns; Not As Described is the costliest reason (2.95M refunded)|
|5|Do low ratings lead to returns?|\[rating 1 has 26.5%, 2 has 24.4%, 3 has 6.2%, 4 and 5 has 5.9 and 5.5% respectively Return Rate.]|
|6|How much money do returns cost?|\[Revenue was 139.7M, but Refund Amount become 9.7M so now Net Revenue becomes 130M]<br />\[Maximum we refunded on Electronics because its items are expensive around 5.9 Millions]<br />\[Highest refund money% by category we have of Sports by 8.9, Toys 8.5%, Books 7.2%, Fashion 7.1%, Grocery 6.9%, Electronics 6.7% Beauty 6.6% Home \& Kitchen 6%]|
|7|Which months need more stock and planning?|\[October, November and December were most busy months.]<br />\[in the December 2024 we have generated highest revenue around 52.9M because we sold out 10444 orders]<br />\[jan, feb, march, are slow and the busyness is in increasing order from jan to december and peak in oct,nov,and dec.]|
|8|Do customers come back?|\[We have 81.2 % customers that buys again]<br />\[We have 39% Occasional Customers (2-3 orders)<br />35% Regular customers (4-10 orders)<br />7% Loyal customers(11+ orders)<br />but One time customers are 19%]<br />\[Also we have generated 96.7% of revenue from repeat customers and 3.3 from one time customers]<br />\[Our Repeat order happens after 116 days, almost on every 4th month]|

\---

## 6\. Dashboard

!\[Overview](Images/dashboard\_overview.png)

!\[Category and Product](Images/category.png)

!\[Sellers](Images/sellers.png)

!\[Customers](Images/customers.png)

!\[Returns and Ratings](Images/returns \& ratings.png)

\---

## 7\. Recommendations

1. Reduce dependence on one low-margin category and grow high-margin categories.
2. Review the high-selling, poorly rated products first; fix quality or listings, or remove them.
3. Warn sellers with return rates above 10% and track return rate on a seller scorecard.
4. Improve product descriptions and quality checks, since most returns are preventable.
5. Plan stock and staff before the peak months; use slow months for clearance and planning.
6. Send a reminder or offer to new customers before the typical reorder window to raise repeat purchases.

\---

## 8\. Limitations

* The data is synthetic, so patterns are for practice, not for real business conclusions.
* "Return cost" means the refunded amount only. It does not include shipping, inspection or unsellable stock.
* Rating and returns are linked, but this analysis does not prove one causes the other.

\---

## 9\. Repository Structure

```
Ecommerce-marketplace-analytics/
|-- Raw\_Data/  messy files
|-- Clean\_Data/  cleaned files
|-- Notebook\_files/
|   |-- Analysis\_notebook\_files/

|   |   |-- 1\_Which categories earn the most revenue and profit

|   |   |-- 2\_Which products sell a lot but are rated poorly

|   |   |-- 3\_Which sellers have high return rates

|   |   |-- 4\_Why do customers return products

|   |   |-- 5\_Do low ratings lead to returns

|   |   |-- 6\_How much money do returns cost

|   |   |-- 7\_Which months need more stock and planning

|   |   |-- 8\_Do customers come back

|   |-- Cleaning\_Notebook\_files/

|   |   |-- customers\_cleaning

|   |   |-- orders\_cleaning

|   |   |-- payments\_cleaning

|   |   |-- products\_cleaning
|   |   |-- returns\_cleaning

|   |   |-- reviews\_cleaning

|   |   |-- sellers\_cleaning 

|-- Sql\_queries/
|   |-- SQL\_ANALYSIS

|-- Power\_Bi\_dashboard/
|   |-- ecommerce\_dashboard.pbix
|-- Images/  dashboard screenshots
|-- README/  README.md file
```

## 10\. How to Run

1. Clone the repository.
2. Install the libraries: pip install pandas numpy matplotlib seaborn jupyter
3. Open the notebooks in order (01 to 8).
4. Open powerbi/ecommerce\_dashboard.pbix in Power BI Desktop.

## Author

**Satyam Yadav** | [LinkedIn](https://www.linkedin.com/in/entsatyamyadav/) | [GitHub](https://github.com/Satyam7001)

