---
output:
  html_document: default
  pdf_document: default
---
# Exploring the tidyverse

This is the repo for the one-day workshop *"Exploring the tidyverse"* taught at [NICAR](https://www.ire.org/conferences/nicar-2019/)'s 2019 confernce in Orange County, California.

It contains significant changes and additions to the original modules by Hadley Wickham, tailored to a data journalism audience and one-day time frame, including new training data and materials on visualization from Andrew Ba Tran and his [R for Journalists](https://learn.r-journalism.com/en/), my own materials and training sequences on transforming data, and Olga Pierce's materials on modeling and statistics. We did keep most of the slides and cheatsheets from the original repo, but created new coding sequences that fall into three main modules:

A. Transforming Data
B. Visualizing Data
C. Modeling Data

This workshop is designed for people who are familiar with some R and want to learn how to achieve their data analysis goals the "tidy" way. 

You will learn how to visualize, transform, and model data in R and work with date-times, character strings, and untidy data formats. Along the way, you will learn and use many packages from the tidyverse including ggplot2, dplyr, tidyr, readr, purrr, tibble, stringr, lubridate, and forcats.

## Software requirements

You'll need the following packages:

```R
install.packages(c("tidyverse", "lubridate", "janitor", "rmarkdown", "usethis"))
```

Then you can grab a local copy of all the slides, code, data, and cheatsheets with:

```R
usethis::use_course("https://bit.ly/2XJD5fB")
```

To get back to this project later, double-click on "data-science-in-the-tidyverse.Rproj".

## License

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a>

<span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">*Data Science in the tidyverse*</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/cwickham/data-science-in-the-tidyverse" property="cc:attributionName" rel="cc:attributionURL">Charlotte Wickham</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.  Based on a work at <a xmlns:dct="http://purl.org/dc/terms/" href="https://github.com/rstudio/master-the-tidyverse" rel="dct:source">https://github.com/rstudio/master-the-tidyverse</a>.

## Acknowledgements

I have forked this repo from [Hadley Wickham](https://github.com/hadley/data-science-in-tidyverse) based on his session at NICAR 2018, who in turn forked it from [Charlotte Wickham](https://github.com/cwickham/data-science-in-tidyverse), who forked it from [RStudio](https://github.com/rstudio/master-the-tidyverse). Thanks to [Charlotte](http://cwick.co.nz) and [Garrett](https://github.com/garrettgman) for creating the slides and cheatsheet materials.