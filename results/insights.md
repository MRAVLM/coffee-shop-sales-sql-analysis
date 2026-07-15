#  Coffee Shop Sales - Key Business Insights

![Coffee Shop Sales Dashboard](../images/Analysis_Dashboard.png)

---

## 📊 1. Revenue Overview

### Total Revenue
**$698,812.33** (6-month period: Jan - Jun 2023)

### Revenue by Store
![Revenue by Store](../images/02_revenue_by_stor.png)

| Rank | Store Location | Revenue | % of Total |
|------|---------------|---------|------------|
| 1 | Hell's Kitchen | $236,511.17 | 33.9% |
| 2 | Astoria | $232,243.91 | 33.2% |
| 3 | Lower Manhattan | $230,057.25 | 32.9% |

** Observation:** Revenue is remarkably balanced across all three locations.

---

## 🏷️ 2. Product Analysis

### Revenue by Category
![Revenue by Category](../images/03_revenue_by_category.png)

| Rank | Category | Revenue | % of Total |
|------|----------|---------|------------|
| 1 | Coffee | $269,952.45 | 38.6% |
| 2 | Tea | $196,405.95 | 28.1% |
| 3 | Bakery | $82,315.64 | 11.8% |
| 4 | Drinking Chocolate | $72,416.00 | 10.4% |
| 5 | Coffee beans | $40,085.25 | 5.7% |

### Top 10 Products by Revenue
![Top Products](../images/04_top_products.png)

| Rank | Product | Revenue | Units Sold |
|------|---------|---------|------------|
| 1 | Barista Espresso | $91,406.20 | 24,943 |
| 2 | Brewed Chai tea | $77,081.95 | 26,250 |
| 3 | Hot chocolate | $72,416.00 | 17,457 |
| 4 | Gourmet brewed coffee | $70,034.60 | 25,973 |
| 5 | Brewed Black tea | $47,932.00 | 17,462 |
| 6 | Brewed herbal tea | $47,539.50 | 17,328 |
| 7 | Premium brewed coffee | $38,781.15 | 12,431 |
| 8 | Organic brewed coffee | $37,746.50 | 13,012 |
| 9 | Scone | $36,866.12 | 10,465 |
| 10 | Drip coffee | $31,984.00 | 12,891 |

**🔍 Key Findings:**
- Coffee products dominate with **38.6%** of total revenue
- **Barista Espresso** is the single best-selling product
- **Brewed Chai tea** has the highest unit sales (26,250 units)

---

## ⏰ 3. Time Analysis

### Monthly Revenue Trend
![Monthly Revenue](../images/05_monthly_revenue.png)

| Month | Revenue | Growth Rate |
|-------|---------|-------------|
| January | $81,677.74 | - |
| February | $76,145.19 | -6.8% |
| March | $98,834.68 | +29.8% |
| April | $118,941.08 | +20.3% |
| May | $156,727.76 | +31.8% |
| June | $166,485.88 | +6.2% |

**🔍 Observation:** Revenue grew by **103.8%** from January to June.

### Peak Hour Analysis
![Peak Hours](../images/06_peak_hours.png)

**Peak Hour:** 10:00 AM - 18,545 transactions

### Time of Day Breakdown
![Time of Day](../images/07_time_of_day.png)

| Period | Revenue | Transactions | Avg. Transaction Value |
|--------|---------|--------------|----------------------|
| Morning (6-11 AM) | $388,288.67 | 81,751 | $4.75 |
| Afternoon (12-5 PM) | $244,855.14 | 53,172 | $4.60 |
| Evening (6-9 PM) | $65,668.52 | 14,193 | $4.63 |

**🔍 Key Finding:** Morning drives **55.6%** of total revenue.

---

## 💰 4. Transaction Analysis

### Transaction Segmentation
![Value Segments](../images/08_value_segments.png)

| Segment | Transactions | Revenue | Avg. Value |
|---------|--------------|---------|------------|
| High Value (>$20) | 1,012 | $31,170.00 | $30.80 |
| Medium ($10-20) | 2,593 | $35,686.99 | $13.76 |
| Low ($5-10) | 52,048 | $338,869.85 | $6.51 |
| Very Low (<$5) | 93,463 | $293,085.49 | $3.14 |

**🔍 Observation:** 62.6% of transactions are low-value (<$5).

---

## 🏆 5. Window Functions Comparison
![Ranking Functions](../images/09_ranking_functions.png)

| Product | Revenue | RANK() | DENSE_RANK() | ROW_NUMBER() |
|---------|---------|--------|--------------|--------------|
| Barista Espresso | $91,406.20 | 1 | 1 | 1 |
| Brewed Chai tea | $77,081.95 | 2 | 2 | 2 |
| Hot chocolate | $72,416.00 | 3 | 3 | 3 |
| Gourmet brewed coffee | $70,034.60 | 4 | 4 | 4 |
| Brewed Black tea | $47,932.00 | 5 | 5 | 5 |

---

##  6. Actionable Recommendations

### 🎯 Marketing Strategies
1. **Morning Rush Focus:** Capitalize on 10 AM peak hour with morning combo deals
2. **Coffee + Tea Promotion:** Create bundle offers for top categories
3. **Chai Tea Upsell:** Brewed Chai tea has highest sales - introduce loyalty rewards

### 📍 Operational Improvements
1. **Staff Scheduling:** Maximize coverage during morning hours (6-11 AM)
2. **Inventory Management:** Prioritize top 5 products
3. **Store Strategy:** Analyze and replicate Hell's Kitchen's success

### 💰 Pricing Opportunities
1. **Premium Line:** Introduce premium versions of top products
2. **Bundle Deals:** Coffee + Scone combo to increase transaction value
3. **Loyalty Program:** Reward frequent buyers

---

**📅 Last Updated:** July 2026
