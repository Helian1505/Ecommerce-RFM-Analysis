# 📊 E-commerce Strategic Intelligence: End-to-End RFM Segmentation
[![BigQuery](https://img.shields.io/badge/Google_BigQuery-4285F4?style=for-the-badge&logo=google-bigquery&logoColor=white)](https://cloud.google.com/bigquery)
[![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=power-bi&logoColor=black)](https://powerbi.microsoft.com/)

## 🎯 Project Overview
This project is an **End-to-End Data Analytics solution** designed to move beyond traditional reporting into **Predictive Customer Intelligence**. Using the *TheLook E-commerce* dataset (GCP), I developed a dynamic **RFM (Recency, Frequency, Monetary)** model to segment 66,000+ customers, identifying high-potential markets and critical retention gaps.

---

## 🖼️ Dashboard Preview
![E-commerce Dashboard](Screenshots/Dashboard.png)
*Full interactive dashboard showing the RFM matrix, geographical distribution, and revenue contribution.*

---

## 🛠️ Data Engineering & SQL Architecture
The core of this project lives in the **Analytical SQL Layer**. I implemented a multi-stage transformation process to ensure data integrity and business relevance.

* **Complex Joins:** Integrated orders, items, and user demographics to create a 360-degree customer view.
* **Business Logic:** Excluded returns and cancellations to report only **Actual Effective Revenue**.
* **Advanced Analytics:** Leveraged Window Functions (`NTILE`, `OVER`, `DATE_DIFF`) to build a scalable scoring system.

🔗 **[View the full SQL Architecture here](SQL_Scripts/rfm_segmentation_query.sql)**

---

## 📈 Strategic Business Insights (The "So What?")
This analysis uncovered critical insights that directly impact the company's bottom line:

### 1. The "Champions Gap" (Growth Opportunity)
* **Finding:** The model identified **zero customers** currently in the 'Champions' segment.
* **Strategy:** This reveals a massive opportunity for a **Loyalty Program Upgrade**. The infrastructure is ready, but the business lacks a "VIP tier" to push users from 'Loyal' to 'Champion'.

### 2. High-Value Concentration
* **Finding:** **'Potential Loyalists'** represent the largest group, driving **~60% of total revenue**.
* **Strategy:** Marketing spend should be reallocated from cold acquisition to **retention campaigns** for this specific group, as they are the current financial engine of the company.

### 3. Geographical Dominance
* **Finding:** Revenue and customer volume are highly concentrated in **China, United States, and Brazil**.
* **Strategy:** These markets should be prioritized for localized logistics and "Next-Day Delivery" pilots to increase purchase frequency.

### 4. Actionable Health Scoring
* By calculating a **Total RFM Score (1-5)**, I created a single metric that allows managers to see the "Health" of a customer at a glance without looking at complex tables.

---

## 🚀 Impact & Skills Demonstrated
* **Cloud Scalability:** Built using BigQuery Views, allowing the dashboard to scale from 66k to millions of rows seamlessly.
* **Data Storytelling:** Translated complex quintile math into easy-to-understand segments like 'At Risk' or 'Potential Loyalists'.
* **Revenue Focused:** Every chart in this dashboard is designed to answer a business question: *How do we make more money from the customers we already have?*

---

## 📬 Let's Connect
Interested in data-driven growth strategies? 

[LinkedIn](https://www.linkedin.com/in/helian-fierro-oyola-143798206/) | [My Portfolio](https://helian1505.github.io/Projects/)
