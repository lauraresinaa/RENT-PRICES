# Apartment Rent and Floodplain Impact Analysis

## Introduction
This repository contains code and documentation for a project that focuses on estimating the impact of living in a floodplain on apartment rental prices. Specifically, we aim to determine how floodplains affect apartment rental prices, with a particular focus on Fukuoka Prefecture, Japan. Floodplains are areas with a higher-than-normal risk of flooding, typically located near major rivers, lakes, or streams.
The RAW DATA is the following: Final Empirical Project Data.RData
The Code used for my analysis: Laura Resina_236BF07B_Final Empirical Project

## Motivation
Understanding the relationship between floodplains and apartment rental prices is crucial for policymakers and economists. It helps in making informed decisions about flood protection measures, such as building dams, levees, and flood walls. Economists typically employ hedonic price models to analyze this relationship. These models decompose apartment rental prices into prices for each of their attributes, allowing us to estimate the impact of living in a floodplain.

## Literature Review
Before building our model, it is essential to review related literature. Previous studies, such as Grether and Mieszkowski, Linneman, and others, have explored various aspects of hedonic price models and identified key variables affecting housing prices. Additionally, research on flood risk and apartment rents reveals that floodplain rents tend to be lower after natural disasters like typhoons.

## Model
We will start by building and refining a regression model to estimate the impact of floodplains on apartment rental prices. Here is a sample model:

```
Rent_i = β0 + β1 * Square_Meters_i + β2 * Floodplain_i + β3 * Year_Built_i + ... + ε_i
```

- `Rent_i`: Monthly rent of apartment `i` (measured in Japanese Yen, including deposit fees).
- `Square_Meters_i`: Size of apartment `i` in square meters.
- `Floodplain_i`: Indicator (0 or 1) whether apartment `i` is located in a floodplain.

## Questions
1. **Theoretical Expectations**: Write out the expected signs of the coefficients and null hypotheses (H0) for `Station_Minutes_i`, `River_Distance_i`, `One_Room_i`, and `Building_Elevator_i`. Provide explanations for your decisions.

2. **Data Summary**: Describe the average apartment in your dataset, provide summary statistics, and identify potential outliers. Check if any variables need scaling.

3. **Initial Regression Model**: Present your initial regression equation and its output from R. Assess the significance and magnitude of coefficients.

4. **Irrelevant Variables**: Identify irrelevant variables in your model and discuss their impact on conclusions.

5. **Additional Variables**: Propose new variables that can be created from the dataset or omitted initially and analyze their impact on the regression.

6. **Floodplain Impact**: Estimate the impact of being in a floodplain on apartment rents when limited to floodplain apartments.

7. **Bias Due to Missing Variables**: Evaluate whether coefficients may be biased due to missing independent variables and attempt to correct this bias using available data.

8. **Functional Form Modifications**: Test different functional forms for your model, such as logging variables or adding quadratic terms. Determine which form works best.

9. **Multicollinearity**: Check for multicollinearity between variables and assess its potential impact on conclusions.

10. **Heteroskedasticity and Serial Correlation**: Test for heteroskedasticity and serial correlation, and discuss how they might affect your conclusions. Propose and apply solutions if needed.

11. **Neighborhood Dummies**: Discuss whether including neighborhood dummies in your regression is necessary and what they control for.

12. **Limited Dependent Variable Models**: Consider if limited dependent variable models should be used to model rental prices and explain why or why not.

13. **Improved Regression Model**: Present a new regression model that addresses issues from questions 2 and 4-12. Explain how this model improves upon the old one.

14. **Statistical Comparison**: Use an F-test or an appropriate statistical measure to compare the new and old models. Draw conclusions from the analysis.

15. **Final Model and Conclusions**: Include the output from your final regression model. Discuss whether your valuation of Floodplain aligns with the literature findings.

## Works Cited
- Atreya, A., Ferreira, S., & Kriesel, W. (2013). Forgetting the flood? An analysis of the flood risk discount over time. Land Economics, 89(4), 577-596.
- Bin, O., & Landry, C. E. (2013). Changes in implicit flood risk premiums: Empirical evidence from the housing market. Journal of Environmental Economics and Management, 65(3), 361-376.

Please refer to the specific sections for detailed instructions and analysis. Good luck with your project!
