# dcmstan (0.1.0)

* GitHub: <https://github.com/r-dcm/dcmstan>
* Email: <mailto:wjakethompson@gmail.com>
* GitHub mirror: <https://github.com/cran/dcmstan>

Run `revdepcheck::revdep_details(, "dcmstan")` for more info

## Newly broken

*   checking tests ...
     ```
       Running ‘spelling.R’
       Running ‘testthat.R’
      ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
       Actual text:
       x | there is no package called 'dcmdata'
       ── Error ('test-utils-hierarchy.R:149:3'): check hierarchy names in specification ──
       Error in `expect_match(err$footer, "lexcial")`: `object` must be a character vector, not `NULL`.
       Backtrace:
           ▆
        1. └─testthat::expect_match(object = err$footer) at test-utils-hierarchy.R:149:3
        2.   └─testthat:::check_character(object)
        3.     └─testthat:::stop_input_type(...)
        4.       └─rlang::abort(message, ..., call = call, arg = arg)
       
       [ FAIL 3 | WARN 0 | SKIP 27 | PASS 263 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking running R code from vignettes ...
     ```
       ‘dcmstan.Rmd’ using ‘UTF-8’... failed
      WARNING
     Errors in running code in vignettes:
     when running code in ‘dcmstan.Rmd’
       ...
     
     > knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
     
     > library(dcmstan)
     
     > library(dcmdata)
     
       When sourcing ‘dcmstan.R’:
     Error: there is no package called ‘dcmdata’
     Execution halted
     ```

# measr (2.0.0)

* GitHub: <https://github.com/r-dcm/measr>
* Email: <mailto:wjakethompson@gmail.com>
* GitHub mirror: <https://github.com/cran/measr>

Run `revdepcheck::revdep_details(, "measr")` for more info

## Newly broken

*   checking running R code from vignettes ...
     ```
       ‘measr.Rmd’ using ‘UTF-8’... failed
       ‘paper.Rmd’ using ‘UTF-8’... OK
      WARNING
     Errors in running code in vignettes:
     when running code in ‘measr.Rmd’
       ...
     The following object is masked from ‘package:stats’:
     
         optim
     
     
     > library(dcmdata)
     
       When sourcing ‘measr.R’:
     Error: there is no package called ‘dcmdata’
     Execution halted
     ```

