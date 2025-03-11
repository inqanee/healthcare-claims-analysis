# Healthcare Claims Analysis Tool

## Project Overview
This project is designed to analyze medical claims data to uncover inefficiencies, streamline workflows, and improve decision-making for healthcare providers.

## Objective
- Identify patterns in claim approvals and denials
- Uncover high-cost procedures and common diagnoses
- Provide interactive dashboards for data-driven decision-making

## Tech Stack
- **Database**: PostgreSQL / Snowflake
- **Backend**: Python (Pandas, NumPy, Matplotlib, SciPy)
- **Visualization**: Power BI

## Features
- **SQL-powered data storage and preprocessing**
- **Python-based trend analysis and insights**
- **Power BI dashboards for real-time monitoring**

## Installation & Usage
### 1️⃣ Clone the Repository
```bash
git clone https://github.com/yourusername/healthcare-claims-analysis.git
cd healthcare-claims-analysis
```

### 2️⃣ Install Dependencies
```bash
pip install -r requirements.txt
```

### 3️⃣ Run Data Processing
```bash
python sql/schema.sql  # Create tables
python claims_analysis.py  # Process data & generate insights
```

### 4️⃣ Open Power BI Dashboard
- Load `dashboards/claims_analysis.pbix` in Power BI to visualize insights.

## License
This project is licensed under the MIT License.
