DROP TABLE IF EXISTS lab_samples;

-- Create the Coal Quality Testing Folder
CREATE TABLE lab_samples (
    sample_id TEXT PRIMARY KEY,
    seam_source TEXT,          -- 'Seam 2', 'Seam 4', etc.
    ash_percentage REAL,       -- High ash = poor quality
    calorific_value REAL,      -- CV (MJ/kg) - Energy content
    volatile_matter REAL,      -- Volatiles %
    total_moisture REAL        -- Moisture %
);



SELECT 
    sample_id,
    seam_source,
    ash_percentage,
    calorific_value,
    CASE 
        WHEN ash_percentage <= 16.0 AND calorific_value >= 26.0 THEN 'Premium Export (RBCT)'
        WHEN ash_percentage <= 30.0 AND calorific_value >= 20.0 THEN 'Domestic Power (Eskom)'
        ELSE 'Discard / Reject'
    END AS commercial_grade
FROM lab_samples;


DROP TABLE IF EXISTS lab_samples;

CREATE TABLE lab_samples (
    sample_id TEXT PRIMARY KEY,
    seam_source TEXT,
    ash_percentage REAL,
    calorific_value REAL,
    volatile_matter REAL,
    total_moisture REAL
);

-- PUTTING THE SAMPLES INTO THE CABINET
INSERT OR IGNORE INTO lab_samples VALUES ('SMP-001', 'Seam 2', 14.5, 27.2, 22.1, 7.5);
INSERT OR IGNORE INTO lab_samples VALUES ('SMP-002', 'Seam 4', 28.1, 19.5, 18.0, 9.2);
INSERT OR IGNORE INTO lab_samples VALUES ('SMP-003', 'Seam 2', 15.2, 26.8, 21.5, 7.8);
INSERT OR IGNORE INTO lab_samples VALUES ('SMP-004', 'Seam 4', 32.4, 16.2, 14.1, 11.5);
INSERT OR IGNORE INTO lab_samples VALUES ('SMP-005', 'Seam 2', 22.0, 23.5, 19.8, 8.1);

-- THE GRADING QUESTION
SELECT 
    sample_id,
    seam_source,
    ash_percentage,
    calorific_value,
    CASE 
        WHEN ash_percentage <= 16.0 AND calorific_value >= 26.0 THEN 'Premium Export (RBCT)'
        WHEN ash_percentage <= 30.0 AND calorific_value >= 20.0 THEN 'Domestic Power (Eskom)'
        ELSE 'Discard / Reject'
    END AS commercial_grade
FROM lab_samples;
