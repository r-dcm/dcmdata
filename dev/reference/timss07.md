# Trends in international mathematics and science study (TIMSS) assessment for grade 4 mathematics (2007)

This is data from the United States sample of the 2007 TIMSS assessment
for grade 4 mathematics. This data contains responses to 25 items from
698 respondents and has been used previously by Lee et al. (2011) and
Park et al. (2014, 2018) to estimate diagnostic classification models.
The data set was uploaded to the Item Response Warehouse (Domingue et
al., 2025) and is reformatted here.

## Usage

``` r
timss07_data

timss07_skill_qmatrix

timss07_topic_qmatrix

timss07_domain_qmatrix
```

## Format

`timss07_data` is a
[tibble](https://tibble.tidyverse.org/reference/tibble-package.html)
containing TIMSS response data with 698 rows and 26 variables.

- `id`: Respondent identifier.

- `M031085`-`M041258B`: Dichotomous item responses to the 25 TIMSS
  items.

`timss07_skill_qmatrix` is a
[tibble](https://tibble.tidyverse.org/reference/tibble-package.html)
that identifies which skills are measured by each TIMSS 2007 item. The
`timss07_skill_qmatrix` is made up of 25 rows and 16 variables.

- `item`: Item identifier, corresponds to item response columns in
  `timss07_data`.

- Attribute columns: 15 columns, one for each attribute. Attributes are
  named as `{domain}_{topic}_{skill}`. For example `n_wn_represent` is
  the skill "Representing, comparing, and ordering whole numbers as well
  as demonstrating knowledge of place value," which falls under the
  "Whole Numbers" topic (`wn`) and "Number" domain (`n`). See Details
  for a complete list of skills. Each column is a dichotomous indicator
  for whether or not the skill is measured by each item. A value of `1`
  indicates the skill is measured by the item and a value of `0`
  indicates the skill is not measured by the item.

`timss07_topic_qmatrix` is a
[tibble](https://tibble.tidyverse.org/reference/tibble-package.html)
that identifies which topics are measured by each TIMSS 2007 item. This
form of the Q-matrix was used by Park et al. (2014, 2018), who combined
the "Number Sentences with Whole Numbers" and "Patterns and
Relationships" topics in the "Number" domain into a single attributes
(`n_nspr`), as well as the "Reading and Interpreting" and "Organizing
and Representing" topics in the "Data & Display" domain (`dd_rior`).
Thus, `timss07_topic_qmatrix` is made up of 25 rows and 8 variables.

- `item`: Item identifier, corresponds to item response columns in
  `timss07_data`.

- Attribute columns: 7 columns, one for each attribute. Attributes are
  named as `{domain}_{topic}`. For example `gm_lm` is the topic
  "Location and Movement," which falls under the "Geometric Shapes &
  Measurement" (`gm`) domain. Each column is a dichotomous indicator for
  whether or not the topic is measured by each item. A value of `1`
  indicates the topic is measured by the item and a value of `0`
  indicates the topic is not measured by the item. See Details for
  complete list of topics.

`timss07_domain_qmatrix` is a
[tibble](https://tibble.tidyverse.org/reference/tibble-package.html)
that identifies which domains are measured by each TIMSS 2007 item. The
`timss07_domain_qmatrix` is made up of 25 rows and 3 variables.

- `item`: Item identifier, corresponds to item response columns in
  `timss07_data`.

- Attribute columns: 3 columns, one for each attribute. Attributes are
  named as `{domain}`. For example `dd` is the domain "Data & Display."
  Each column is a dichotomous indicator for whether or not the domain
  is measured by each item. A value of `1` indicates the domain is
  measured by the item and a value of `0` indicates the domain is not
  measured by the item. See Details for a complete list of domains.

## Details

The skills for the 2007 TIMSS are organized into domains and topics.
Attribute names in Q-matrices are named by combining the hierarchical
elements. For example, `timss07_skill_qmatrix` attributes names are
`{domain}_{topic}_{skill}`, whereas attributes in
`timss07_topic_qmatrix` are named `{domain}_{topic}`.

|                                       |                                            |                                                                                                                                                                                               |
|---------------------------------------|--------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Domain**                            | **Topic**                                  | **Skill**                                                                                                                                                                                     |
| Number (`n`)                          | Whole Numbers (`wn`)                       | Representing, comparing, and ordering whole numbers as well as demonstrating knowledge of place value (`represent`)                                                                           |
| Number (`n`)                          | Whole Numbers (`wn`)                       | Recognize multiples, computing with whole numbers using the four operations, and estimating computations (`compute`)                                                                          |
| Number (`n`)                          | Whole Numbers (`wn`)                       | Solve problems, including those set in real life contexts (`solve`)                                                                                                                           |
| Number (`n`)                          | Whole Numbers (`wn`)                       | Solve problems involving proportions (`proportions`)                                                                                                                                          |
| Number (`n`)                          | Fractions and Decimals (`fd`)              | Recognize, represent, and understand fractions and decimals as parts of a whole and their equivalents (`parts`)                                                                               |
| Number (`n`)                          | Fractions and Decimals (`fd`)              | Solve problems involving simple fractions and decimals including their addition and subtraction (`solve`)                                                                                     |
| Number (`n`)                          | Number Sentences with Whole Numbers (`ns`) | Find the missing number or operation and model simple situations involving unknowns in number sentence or expressions (`model`)                                                               |
| Number (`n`)                          | Patterns and Relationships (`pr`)          | Describe relationships in patterns and their extensions; generate pairs of whole numbers by a given rule and identify a rule for every relationship given pairs of whole numbers (`describe`) |
| Geometric Shapes & Measurement (`gm`) | Lines and Angles (`la`)                    | Measure, estimate, and understand properties of lines and angles and be able to draw them (`properties`)                                                                                      |
| Geometric Shapes & Measurement (`gm`) | Two- and Three-dimensional Shapes (`tt`)   | Classify, compare, and recognize geometric figures and shapes and their relationships and elementary properties (`figures`)                                                                   |
| Geometric Shapes & Measurement (`gm`) | Two- and Three-dimensional Shapes (`tt`)   | Calculate and estimate perimeters, area, and volume (`calculate`)                                                                                                                             |
| Geometric Shapes & Measurement (`gm`) | Location and Movement (`lm`)               | Locate points in an informal coordinate to recognize and draw figures and their movement (`locate`)                                                                                           |
| Data & Display (`dd`)                 | Reading and Interpreting (`ri`)            | Read data from tables, pictographs, bar graphs, and pie charts (`read`)                                                                                                                       |
| Data & Display (`dd`)                 | Reading and Interpreting (`ri`)            | Comparing and understanding how to use information from data (`information`)                                                                                                                  |
| Data & Display (`dd`)                 | Organizing and Representing (`or`)         | Understanding different representations and organizing data using tables, pictographs, and bar graphs (`data`)                                                                                |

For more details, see Table 2 of Lee et al. (2011).

## References

Domingue, B., Braginsky, M., Caffrey-Maffei, L., Gilbert, J. B.,
Kanopka, K., Kapoor, R., Lee, H., Liu, Y., Nadela, S., Pan, G., Zhang,
L., Zhang, S., & Frank, M. C. (2025). An introduction to the Item
Response Warehouse (IRW): A resource for enhancing data usage in
psychometrics. *Behavior Research Methods, 57*, Article 276.
[doi:10.3758/s13428-025-02796-y](https://doi.org/10.3758/s13428-025-02796-y)

Lee, Y.-S., Park, Y. S., & Taylan, D. (2011). A cognitive diagnostic
modeling of attribute mastery in Massachusetts, Minnesota, and the U.S.
national sample using the TIMSS 2007. *International Journal of Testing,
11*(2), 144-177.
[doi:10.1080/15305058.2010.534571](https://doi.org/10.1080/15305058.2010.534571)

Park, Y. S., & Lee, Y.-S. (2014). An extension of the DINA model using
covariates: Examining factors affecting response probability and latent
classification. *Applied Psychological Measurement, 38*(5), 376-390.
[doi:10.1177/0146621614523830](https://doi.org/10.1177/0146621614523830)

Park, Y. S., Xing, K., & Lee, Y.-S. (2018). Explanatory cognitive
diagnostic models: Incorporating latent and observed predictors.
*Applied Psychological Measurement, 42*(5), 376-392.
[doi:10.1177/0146621617738012](https://doi.org/10.1177/0146621617738012)
