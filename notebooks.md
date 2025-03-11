# data_cleaning.ipynb (Notebook Structure)

**Step 1: Load Data**
```python
import pandas as pd

# Load the dataset
claims = pd.read_csv('../data/claims_data.csv')
```

**Step 2: Check for Missing Values**
```python
print(claims.isnull().sum())
```

**Step 3: Handle Missing Values**
```python
claims.fillna({'status': 'Pending'}, inplace=True)  # Fill missing statuses with 'Pending'
claims.dropna(subset=['cost'], inplace=True)  # Remove rows with missing cost values
```

**Step 4: Remove Invalid Entries**
```python
claims = claims[claims['cost'] > 0]  # Ensure all claim costs are positive
```

**Step 5: Save Cleaned Data**
```python
claims.to_csv('../data/cleaned_claims.csv', index=False)
```

---

# claims_trends.ipynb (Notebook Structure)

**Step 1: Load Cleaned Data**
```python
import pandas as pd
import matplotlib.pyplot as plt

claims = pd.read_csv('../data/cleaned_claims.csv')
```

**Step 2: Identify Trends in Claims Data**
```python
# Count claims by status
trend = claims['status'].value_counts()
print(trend)
```

**Step 3: Visualize Trends**
```python
plt.bar(trend.index, trend.values, color=['green', 'red', 'blue'])
plt.xlabel('Claim Status')
plt.ylabel('Number of Claims')
plt.title('Claims Status Distribution')
plt.show()
```

---

# insights.ipynb (Notebook Structure)

**Step 1: Load Data**
```python
import pandas as pd
import scipy.stats as stats

claims = pd.read_csv('../data/cleaned_claims.csv')
```

**Step 2: Statistical Analysis of Claim Approvals**
```python
approved = claims[claims['status'] == 'Approved']['cost']
denied = claims[claims['status'] == 'Denied']['cost']

# Perform a t-test to compare the cost distributions
stat, p_value = stats.ttest_ind(approved, denied, equal_var=False)
print(f'T-Test Result: p-value = {p_value}')
```

**Step 3: Interpret Results**
```python
if p_value < 0.05:
    print('Significant difference in cost between approved and denied claims.')
else:
    print('No significant cost difference between approved and denied claims.')
```
