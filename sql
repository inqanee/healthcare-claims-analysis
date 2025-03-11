# schema.sql
CREATE TABLE claims (
    claim_id SERIAL PRIMARY KEY,
    patient_id INT,
    provider_id INT,
    diagnosis_code VARCHAR(10),
    procedure_code VARCHAR(10),
    cost DECIMAL(10,2),
    status VARCHAR(20) CHECK (status IN ('Approved', 'Denied', 'Pending')),
    date_of_service DATE
);

CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    age INT,
    gender VARCHAR(10),
    insurance_provider VARCHAR(100)
);

CREATE TABLE providers (
    provider_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    specialty VARCHAR(100),
    location VARCHAR(100)
);

---

# cleaning_queries.sql
DELETE FROM claims WHERE cost < 0;
UPDATE claims SET status = 'Denied' WHERE status IS NULL;
ALTER TABLE claims ADD COLUMN claim_processed BOOLEAN DEFAULT FALSE;

---

# analysis_queries.sql
-- Find the most common denied claims
SELECT diagnosis_code, COUNT(*) AS denial_count
FROM claims
WHERE status = 'Denied'
GROUP BY diagnosis_code
ORDER BY denial_count DESC
LIMIT 10;

-- Identify providers with the highest approval rates
SELECT provider_id, 
       COUNT(*) AS total_claims, 
       SUM(CASE WHEN status = 'Approved' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS approval_rate
FROM claims
GROUP BY provider_id
ORDER BY approval_rate DESC;

-- Calculate the average claim cost by procedure
SELECT procedure_code, AVG(cost) AS avg_cost
FROM claims
GROUP BY procedure_code
ORDER BY avg_cost DESC;
