# Generate unique identifiers

Create unique alphanumeric identifiers with a specified character length
and proportions of alpha and numeric characters.

## Usage

``` r
generate_ids(n, characters, prop_numeric = 1, n_attempt = n * 3)
```

## Arguments

- n:

  The number of unique identifiers to generate.

- characters:

  The number of characters to be included in each identifier.

- prop_numeric:

  The proportion of `characters` that should be numeric. The default is
  `1` (i.e., all numbers). If less than 1, identifiers will also include
  lowercase and uppercase letters.

- n_attempt:

  The number of allowed attempts for generating the requested number of
  identifiers. See details for more information.

## Value

A factor vector of length `n`.

## Details

When identifiers are long (e.g., `characters` \>= 10), it is slow and
computationally intensive to find all possible permutations of the
specified number of alpha and numeric characters. Therefore, identifiers
are generated one at a time by sampling the required number of
characters. This greatly increases efficiency, as we don't waste time
generating multiple millions of identifiers when we might only need a
few hundred. However, this means that it is possible we could generate
duplicate identifiers. The `n_attempt` argument allows us to control how
many identifiers we can generate in order to achieve our desired `n`
unique identifiers. If we fail to find `n` unique identifiers after
`n_attempt`, the function will error. For example, consider a request
for 1,000 identifiers, each with 2 characters and only using numbers.
With the number 0-9, there are only 100 possible two-character
permutations. Thus, after `n_attempt`, the function will fail as 1,000
unique identifiers cannot be found.

## Examples

``` r
generate_ids(n = 10, characters = 5)
#>  [1] 65354 41614 65584 75530 02741 26195 51782 18595 02604 40163
#> 10 Levels: 02604 02741 18595 26195 40163 41614 51782 65354 ... 75530
generate_ids(n = 100, characters = 10, prop_numeric = 0.5)
#>   [1] d8w42ZQ5H1 Wfg60A342l 993b2Se4nL i9y63jis77 p7chl257l6 6AaQ8j03y8
#>   [7] 49HDnf13K2 477pK69UYz 07P2P09OVQ 3Vu2u3v6s3 qe5e11oB97 guOf6679P1
#>  [13] 9Vz6R3Bm61 8pX0O000EI 19fI9LP64g 0mje219nQ0 v4kT49dF80 ef908V5h7c
#>  [19] P20h89CS0H g078ReXl61 4S3CDDh187 3g6T6ZO8Z1 32Nsw0w06v 3Qw7Gm794C
#>  [25] m203aW8Z2v 2a6v6Z6M1R VI08s88a1k 81sg79diV5 499Xb8UK1t Cv98G85ev7
#>  [31] 2G9a3oM7d9 2iLBI9D915 x9wlR5589d d0N97XC0z2 b3051vck5q a9849CJ9ju
#>  [37] s7G570Cin1 W746cwo93W JC7726r6yL 2F54P7Aym1 VA5x1I055w B37C8bp7t8
#>  [43] DV8ex6962L 1Q43T2ii9t RoD9I032d3 99mRg626Nv U4gOf7U448 667zQPq4b1
#>  [49] KG4d0015An G7p421VQ1p 9T7E8vB4Z3 3Z6q020jqN 4C398u9hMO 34FR455QrW
#>  [55] S316I66BIc xw0990vOh4 w79k2eA68I H4Jj2mw514 3m72iV2hv2 8LB9W1B08B
#>  [61] 32k3fL55ct wL25K58z0B 4Tpa1I93k3 G38R9jz8z2 4a1I46J2bT sl27g8i4t9
#>  [67] 6lur0I369a E6b7X2v90Y 50m62ju2Gd e107Yf9u8I 4V35nELq53 p79v98nO6t
#>  [73] 28ae72S0kw 9yMu0bu830 04e63Y0Ogj 836Zqk0VV8 Gf0628o7gk Cq24wz7V35
#>  [79] m706g9lkp5 6C8l396tyw 67mDp2d20d uP744EL7r5 z04MiN850r 39U1J28btX
#>  [85] h0y3pz2Z81 4M6xh2Qo78 82V36DBC5c 8bmsE8351R MSo2796yO7 3AhN0PK926
#>  [91] 644sn7mG5H 4w9Hb2a50U I6C1Lm49w7 5q1k33c1pj 9PpPs5613f Ll638VU6S8
#>  [97] R93pc45F4g 8G5ew1jc50 WUc991R2P4 9i9z3lht79
#> 100 Levels: 04e63Y0Ogj 07P2P09OVQ 0mje219nQ0 19fI9LP64g ... z04MiN850r
```
