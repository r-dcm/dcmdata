# Tatsuoka fraction subtraction data

The fraction subtraction data was originally described by Tatsuoka
(1990) to introduce the rule space model, and later by Tatsuoka (2002)
demonstrate the use of cognitive modeling in educational testing. The
data contains responses from 536 respondents to 20 items which ask about
different skills related to the subtraction of fractions. The data set
was uploaded to the Item Response Warehouse (Domingue et al., 2025) and
is reformatted here.

## Usage

``` r
fraction_data

fraction_qmatrix
```

## Format

`fraction_data` is a
[tibble](https://tibble.tidyverse.org/reference/tibble-package.html)
containing response data with 536 rows and 21 variables:

- `id`: Respondent identifier.

- `item_1`-`item_20`: Dichotomous item responses to the 20 fraction
  subtraction items.

`fraction_qmatrix` is a
[tibble](https://tibble.tidyverse.org/reference/tibble-package.html)
that identifies which skills are measured by each item. This assessment
contains 20 items measuring 8 skills. The `fraction_qmatrix`
correspondingly is made up of 20 rows and 9 variables.

- `item`: Item identifier, corresponds to item response columns in
  `fraction_data`.

- Attribute columns: 8 columns, one for each attribute. Each is a
  dichotomous indicator for whether or not the skill is measured by each
  item. A value of `1` indicates the skill is measured by the item and a
  value of `0` indicates the skill is not measured by the item.

## Details

The skills correspond to knowledge of:

- `convert`: Convert a whole number to a fraction.

- `separate`: Separate a whole number from a fraction.

- `simplify`: Simplify before subtracting.

- `common`: Find a common denominator.

- `borrow_whole`: Borrow from a whole number part.

- `borrow_numerator`: Column borrow to subtract the second numerator
  from the first.

- `subtract`: Subtract numerators.

- `reduce`: Reduce the answer to its simplest form.

## References

Domingue, B., Braginsky, M., Caffrey-Maffei, L., Gilbert, J. B.,
Kanopka, K., Kapoor, R., Lee, H., Liu, Y., Nadela, S., Pan, G., Zhang,
L., Zhang, S., & Frank, M. C. (2025). An introduction to the Item
Response Warehouse (IRW): A resource for enhancing data usage in
psychometrics. *Behavior Research Methods, 57*, Article 276.
[doi:10.3758/s13428-025-02796-y](https://doi.org/10.3758/s13428-025-02796-y)

Tatsuoka, C. (2002). Data analytic methods for latent partially ordered
classification models. *Journal of the Royal Statistical Society: Series
C (Applied Statistics), 51*(3), 337-350.
[doi:10.1111/1467-9876.00272](https://doi.org/10.1111/1467-9876.00272)

Tatsuoka, K. K. (1990). Toward an integration of item-response theory
and cognitive error diagnosis. In N. Frederiksen, R. Glaser, A. Lesgold,
& M. G. Shafto (Eds.), *Diagnosing monitoring of skill and knowledge
acquisition* (pp. 453-488). Lawrence Erlbaum Associates.
