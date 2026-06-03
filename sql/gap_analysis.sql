-- gap_analysis.sql | India Drug Approval Gap Analysis 
-- Calculates gap = burden_rank - approval_rank per therapeutic area 
 
WITH approval_counts AS ( 
    SELECT therapeutic_area, COUNT(*) AS approval_count 
    FROM '../data/cdsco_approvals_2025.csv' 
    GROUP BY therapeutic_area 
), 
 
approval_ranks AS ( 
    SELECT therapeutic_area, approval_count, 
        RANK() OVER (ORDER BY approval_count DESC) AS approval_rank 
    FROM approval_counts 
), 
 
burden_ranks AS ( 
    SELECT * FROM (VALUES 
        ('Diabetes / Obesity', 1), 
        ('Cardiovascular', 2), 
        ('Oncology', 3), 
        ('Respiratory (COPD)', 4), 
        ('Neurology', 5), 
        ('Infectious disease', 6), 
        ('Gastrointestinal', 7), 
        ('Reproductive health', 8), 
        ('Dermatology', 9), 
        ('Immunology', 10), 
        ('Ophthalmology', 11), 
        ('Hematology', 12), 
        ('Blood product', 13), 
        ('Diagnostic', 14), 
        ('Musculoskeletal', 15), 
        ('Inflammation', 16) 
    ) AS b(therapeutic_area, burden_rank) 
) 
 
SELECT 
    b.therapeutic_area, 
    b.burden_rank, 
    COALESCE(a.approval_count, 0) AS approval_count, 
    COALESCE(a.approval_rank, 17) AS approval_rank, 
    b.burden_rank - COALESCE(a.approval_rank, 17) AS gap 
FROM burden_ranks b 
LEFT JOIN approval_ranks a ON b.therapeutic_area = a.therapeutic_area 
ORDER BY gap DESC; 
