# Trends in international mathematics and science study (TIMSS) assessment for grade 8 mathematics (2003)

This is data from the United States sample of the 2003 TIMSS assessment
for grade 8 mathematics. This data contains responses to 23 items from
757 respondents. This data has been used by Skaggs et al. (2016) and Su
et al. (2013) to evaluate the appropriateness of using diagnostic models
for modeling the TIMSS assessment data. The data set was uploaded to the
Item Response Warehouse (Domingue et al., 2025) and is reformatted here.

## Usage

``` r
timss03_data

timss03_qmatrix
```

## Format

`timss03_data` is a
[tibble](https://tibble.tidyverse.org/reference/tibble-package.html)
containing TIMSS response data with 757 rows and 24 variables.

- `id`: Respondent identifier.

- `M012001`-`M022234B`: Dichotomous item responses to the 23 TIMSS
  items.

`timss03_qmatrix` is a
[tibble](https://tibble.tidyverse.org/reference/tibble-package.html)
that identifies which skills are measured by each TIMSS 2003 item. This
data set contains a subset of data consisting of 23 items measuring 13
skills. The `timss03_qmatrix` correspondingly is made up of 23 rows and
14 variables.

- `item`: Item identifier, corresponds to item response columns in
  `timss03_data`.

- Attribute columns: 13 columns, one for each attribute. Each is a
  dichotomous indicator for whether or not the skill is measured by each
  item. A value of `1` indicates the skill is measured by the item and a
  value of `0` indicates the skill is not measured by the item.

## Details

The skills correspond to knowledge of:

- `understand_ratio`: Understand concepts of a ratio and a unit rate.

- `use_ratio`: Use ratio and rate reasoning to solve problems.

- `compute_fluently`: Compute fluently with multi-digit numbers.

- `rational_numbers`: Apply and extend understandings of numbers to the
  system of rational numbers.

- `algebraic_expressions`: Apply and extend understandings of arithmetic
  to algebraic expressions.

- `one_variable_equations`: Solve one-variable equations and
  inequalities.

- `recognize_proportional_relationships`: Recognize and represent
  proportional relationships between quantities.

- `use_proportional_relationships`: Use proportional relationships to
  solve multi-step ratio and percent problems.

- `asmd_rational_numbers`: Add, subtract, multiply, and divide rational
  numbers.

- `expressions_equations`: Solve problems using numerical and algebraic
  expressions and equations.

- `compare_fractions`: Compare two fractions with different numerators
  and denominators.

- `multistep_problems`: Solve multi-step problems with whole numbers
  using the four operations.

- `equivalent_fractions`: Use equivalent fraction as a strategy to add
  and subtract fractions.

For more details, see Table 2 of Su et al. (2013).

## References

Domingue, B., Braginsky, M., Caffrey-Maffei, L., Gilbert, J. B.,
Kanopka, K., Kapoor, R., Lee, H., Liu, Y., Nadela, S., Pan, G., Zhang,
L., Zhang, S., & Frank, M. C. (2025). An introduction to the Item
Response Warehouse (IRW): A resource for enhancing data usage in
psychometrics. *Behavior Research Methods, 57*, Article 276.
[doi:10.3758/s13428-025-02796-y](https://doi.org/10.3758/s13428-025-02796-y)

Su, Y.-L., Choi, K. M., Lee, W.-C., Choi, T., & McAninch, M. (2013).
*Hierarchical cognitive diagnostic analysis for TIMSS 2003 mathematics*
(Research Report No. 35). University of Iowa, Center for Advanced
Studies in Measurement and Assessment.
<https://education.uiowa.edu/sites/education.uiowa.edu/files/2022-10/casma-research-report-35.pdf>
