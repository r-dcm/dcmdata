# Log-odds transformation

These functions implement the log-odds (or logit) transformation. This
is a common transformation for psychometric models that is used to put
probabilities on a continuous scale.

## Usage

``` r
logit(x)

inv_logit(x)
```

## Arguments

- x:

  A number to be transformed.

## Value

A transformed double.

## Examples

``` r
logit(0.6)
#> [1] 0.4054651
logit(0.5)
#> [1] 0

inv_logit(3.5)
#> [1] 0.9706878
inv_logit(0)
#> [1] 0.5
```
