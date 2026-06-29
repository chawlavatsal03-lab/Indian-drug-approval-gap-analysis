# India Pharma Gap Analysis (2015–2026)

## Objective
Identify therapeutic areas with the highest disease burden but the lowest drug approvals in India – revealing market gaps and policy failures.

## Data Sources
- **WHO Global Burden of Disease (GBD) 2019**: Disease burden (DALYs/Deaths) for India by therapeutic area.
- **CDSCO Drug Approvals (2025–2026)**: Extracted via news mining and official CDSCO portal.
- **WHO Hepatitis Report (2026)**: Supplementary data for Hepatitis burden.

## Methodology
### 1. Burden Ranking
Therapeutic areas were ranked by total disease burden (DALYs and mortality) using WHO GBD data for India.

### 2. Approval Ranking
Drug approvals were counted per therapeutic area based on CDSCO new drug approvals (2025–2026). The area with the *most* approvals gets rank 1.

### 3. Gap Score Calculation
`gap = (burden_rank) − (approval_rank)`
- **Positive gap (+)** = High burden, low approvals → **Under-served** (e.g., Hepatitis).
- **Negative gap (-)** = Low burden, high approvals → **Over-served** (e.g., Obesity).
- **Zero (0)** = Balanced.

### 4. Trend Analysis
Gap scores were compared between 2015 and 2026 to identify widening or narrowing market gaps.

## Key Findings
- **Hepatitis** has the largest gap (+5) – severely under-served.
- **Tobacco-related cancers** show a policy gap (+3).
- **Obesity** is over-served (-4) – market-driven R&D.
- **CVD and Diabetes** are "me-too" markets.

## Limitations & Mitigation
- **CDSCO data gap (2023–2026)**: Addressed by systematic news mining from four source categories (official releases, pharma news, government statements) with dual verification.
- **GBD data lag (2021)**: 2026 figures are modelled; trend analysis focuses on relative changes.

## Repository Structure
- `data/`: Raw and processed CSV files.
- `notebooks/`: Jupyter notebook with complete analysis and inline visualizations.
- `reports/`: HTML export of the notebook (viewable without Python).
- `sql/`: SQL queries used for data extraction.

## Quick Start
```bash
git clone https://github.com/chawlavatsal03-lab/Indian-drug-approval-gap-analysis.git
cd Indian-drug-approval-gap-analysis
pip install -r requirements.txt
jupyter notebook notebooks/gap_analysis.ipynb