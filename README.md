# DID_project
My undergraduate thesis: Research on the Impact of Cross-border E-commerce Pilot Zones on the Domestic Value Chain Upgrading

## 1. Project Overview:
 Based on the relevant theories of value chain, this study examines how **cross-border e-commerce pilot zones**, initially launched in Hangzhou in 2015 and subsequently extended to 12 more Chinese cities in 2016, contribute to the upgrading of regional **domestic value chain positions**.
   
Using panel data of 30 provinces and 42 industries from 2012, 2015, and 2017 of China's provincial regional input-output tables, the study examines the impact of the policy, explores potential transmission mechanisms, and investigates regional heterogeneity. 

The repository contains the Stata code and full research information associated with my thesis.

## 2. Reasearch Question
The study addresses three main quetions:

- Does the establishment of Cross-Border E-Commerce Pilot Zones promote domestic value chain upgrading?

- Through what potential mechanisms does the policy affect domestic value chain upgrading?

- Does the policy effect differ across regions?

## 3. Data
- Data Source: Inter-provincial non-competitive input-output table in China
- Sample Years: 2012, 2015 and 2017
- Policy of Interest: Establishment of Cross-Border E-Commerce Comprehensive Pilot Zones in 2015 and 2016.
- Data Type: Province-Industry-Year Panel Data

## 4. Methodology
The study uses a Difference-in-Differences (DID) framework to investigate the policy's effect on domestic value chain upgrading.

The empirical analysis includes:
- Baseline analysis: Estimation of the relationship between the policy and domestic value chain upgrading.

- Robustness checks: Assessment of the robustness of the baseline findings through parallel trend test and placebo test.

- Mechanism analysis: Examination of industrial structure upgrading, industrial agglomeration, and foreign investment inflows as potential transmission mechanisms.

- Regional heterogeneity analysis: Comparison of estimated policy effects between northern and southern regions.

## 5. Main Findings

The study reports the following findings:

**Positive policy effect**: The establishment of Cross-Border E-Commerce Comprehensive Pilot Zones has a statistically significant positive effect on domestic value chain upgrading. The reported result is robust to the robustness checks conducted in the study.

**Potential transmission mechanisms**: The policy promotes domestic value chain upgrading through industrial structure upgrading, industrial agglomeration, and foreign investment inflows.

**Regional heterogeneity**: The estimated policy effect is more pronounced in northern China than in southern China. This finding may provide a reference for policies aimed at addressing regional economic development imbalances.

## 6. Repository Structure

```text
DID_project/
├── README.md
├── thesis/
│   └── Research on the Impact of Cross-border E-commerce Pilot Zone on the Domestic Value Chain Upgrading.pdf
├── code/
│   └── main.do
├── data/
    └── original data/
       └── 2012, 2015 and 2017
    └── final data
    └──  final data. dta
└── results/
    └── all research related original results
```

- `README.md`: Project overview, research questions, methodology, and main findings.
- `thesis/`: The undergraduate thesis document.
- `code/`: Stata scripts for data processing and empirical analysis.
- `data/`: Original research data and processed final data. Inter-provicial non-competitive input-output table across 31 provinces and 42 industires in China.
- `results/`: Descriptive statistics，regression tables, robustness check and other empirical results.



## 7. Thesis
Thesis title: The Impact of Cross-Border E-Commerce Pilot Zones on Domestic Value Chain Upgrading in China

The thesis document is included in the repository where permitted. Please refer to the uploaded thesis file for the full research discussion and empirical analysis.

## 8. Author and Project Information

Author: Yinuo Zhang

Institution: Business School, Dalian University of Technology

Project type: Undergraduate thesis 

Research area: Domestic Value Chain, Regional Economics, and Cross-border E-commerce Pilot Zone

