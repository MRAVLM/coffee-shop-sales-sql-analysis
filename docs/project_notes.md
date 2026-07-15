# 📘 Coffee Shop Sales Analysis - Personal Learning Notes

## 🎯 Project Goals
1. Demonstrate practical SQL skills for Data Analyst roles.
2. Build a complete, end-to-end portfolio project.
3. Practice advanced SQL techniques (CTEs, Window Functions).
4. Learn how to translate raw data into actionable business recommendations.

---

## 📊 Dataset Overview
- **Total Records:** 149,116 transactions
- **Time Period:** Jan 2023 - Jun 2023 (6 months)
- **Scope:** 3 store locations, 9 product categories, 29 unique products
- **Total Revenue Analyzed:** $698,812.33

---

## 📚 What I Learned (SQL Concepts Mastered)

### ✅ Intermediate Skills Applied
- **Conditional Logic:** Used `CASE` statements to segment transaction values (High, Medium, Low).
- **Date/Time Manipulation:** Used `EXTRACT` and `TO_CHAR` to analyze hourly, daily, and monthly trends.
- **Data Validation:** Wrote queries to proactively check for NULLs, duplicates, and negative prices.

### ✅ Advanced Skills Applied
- **Common Table Expressions (CTEs):** Broke down complex logic (like running totals and MoM growth) into readable, modular blocks.
- **Window Functions:** 
  - `RANK()` / `DENSE_RANK()` / `ROW_NUMBER()` for product performance ranking.
  - `LAG()` for calculating Month-over-Month revenue changes.
  - `SUM() OVER (PARTITION BY ... ORDER BY ...)` for cumulative running totals per store.

---

## 🧠 Key Takeaways from the Analysis

### Business Takeaways
1. **Consistent Growth:** Despite a slight dip in February, revenue grew by an impressive 103.8% over 6 months.
2. **Operational Balance:** All 3 stores perform nearly identically (within a $6,500 margin), suggesting standardized and effective operations.
3. **Morning Dominance:** 55.6% of revenue comes from the 6 AM - 11 AM window. Staffing must reflect this reality.

### Technical Takeaways
1. **Data Quality First:** Running basic validation queries *before* deep analysis saved hours of potential debugging.
2. **CTEs > Subqueries:** For the "Month-over-Month" calculation, using a CTE made the query 10x more readable than a nested subquery.
3. **Window Frame Matters:** Learned the hard way that `LAST_VALUE()` requires `ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING` to work as expected in PostgreSQL.

---

## 💡 Challenges Faced & Solutions

### Challenge 1: Understanding Window Function Nuances
**Problem:** Initially confused about when to use `RANK()` vs `DENSE_RANK()`.  
**Solution:** Created a side-by-side comparison query in `07_window_functions.sql` to visually see how ties are handled. Documented the difference in this file for future reference.

### Challenge 2: Structuring the "Master Query"
**Problem:** Wanted to pull all key metrics (total revenue, top store, top product) into a single summary table, but the aggregations conflicted.  
**Solution:** Used multiple independent CTEs for each metric, then combined them at the end using `CROSS JOIN`. This kept the logic clean and the execution time under 300ms.

---

## 🔄 Next Steps & Future Improvements

### Immediate Next Steps
- [x] Complete all 7 SQL script files.
- [x] Write comprehensive documentation (this file, README, insights).
- [x] Generate and save query result screenshots in the `/images` folder.
- [ ] Publish to GitHub and share on LinkedIn.

### Future Portfolio Expansions
1. **Python/Pandas Version:** Replicate this analysis using Python to demonstrate versatility in data manipulation.
2. **Interactive Dashboard:** Connect the PostgreSQL database to Power BI or Tableau to build an interactive, real-time dashboard.
3. **Predictive Analysis:** Use the 6-month trend to forecast July-December revenue using basic time-series techniques.

---

## 📌 Tips for My Future Self
1. **Always check NULLs first.** It saves hours of debugging weird aggregation results.
2. **Comment your code.** Future you (or a reviewer) will thank you for explaining *why* a query is written a certain way.
3. **Test with `LIMIT`.** Always run a `SELECT * ... LIMIT 10` before running a massive `GROUP BY` on 150k rows.
4. **Focus on the "So What?".** Don't just write queries; always ask, "What business decision does this number support?"

---

## 🏆 Final Reflection

**Time Investment:** ~10 hours  
- Research & Learning: 4 hours  
- Query Writing & Debugging: 3 hours  
- Documentation & Formatting: 2 hours  
- Polish & Review: 1 hour  

**Skills Validated:**  
✅ Data Cleaning & Validation  
✅ Advanced SQL Querying & Optimization  
✅ Business Analysis & Storytelling  
✅ Technical Documentation  
✅ Version Control (Git/GitHub)  

*Note to self: This project proves I can handle real-world data, write clean code, and deliver actionable business insights. Use this confidently in job applications!* 💪

---
📅 **Started:** 2026 july
📅 **Completed:** 2026 july
⏱️ **Time Spent:** ~10 hours  

*Keep building, keep growing!* 🚀