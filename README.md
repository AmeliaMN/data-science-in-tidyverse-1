---
output:
  html_document: default
  pdf_document: default
---
# Exploring the tidyverse

This is the repo for *"Exploring the tidyverse"* taught at [NICAR](https://www.ire.org/conferences/nicar-2019/)'s 2019 confernce in Orange County, California.

This is a one-day hands-on workshop based on the book [R for Data Science](http://r4ds.had.co.nz/). This workshop is designed for people who are familiar with R and want to learn how to achieve their data analysis goals the "tidy" way. You will learn how to visualize, transform, and model data in R and work with date-times, character strings, and untidy data formats. Along the way, you will learn and use many packages from the tidyverse including ggplot2, dplyr, tidyr, readr, purrr, tibble, stringr, lubridate, and forcats.

(While the original material contained two days' worth of content, this repository is a slimmed-down version designed to fit into the one-day NICAR 2019 workshop. It also contains some additional changes to the original modules to tailor them to the NICAR 2019 workshop.)
<<<<<<< HEAD

NOTE: This modified repository is currently a work in progress, prior to NICAR 2019.
=======
>>>>>>> 6df20fdba2d970ec7f4b1f888c0f947c3b9249da

## Software requirements

You'll need the following packages:

```R
install.packages(c("tidyverse", "fivethirtyeight", "gapminder", "rmarkdown", "usethis"))
```

Then you can grab a local copy of all the slides, code, data, and cheatsheets with:

```R
usethis::use_course("BITLYLINK")
```

To get back to this project later, double-click on "data-science-in-the-tidyverse.Rproj".

## License

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a>

<span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">*Data Science in the tidyverse*</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/cwickham/data-science-in-the-tidyverse" property="cc:attributionName" rel="cc:attributionURL">Charlotte Wickham</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.  Based on a work at <a xmlns:dct="http://purl.org/dc/terms/" href="https://github.com/rstudio/master-the-tidyverse" rel="dct:source">https://github.com/rstudio/master-the-tidyverse</a>.

## Acknowledgements

I have forked this repo from [Hadley Wickham](https://github.com/hadley/data-science-in-tidyverse) based on his session at NICAR 2018, who in turn forked it from [Charlotte Wickham](https://github.com/cwickham/data-science-in-tidyverse), who forked it from [RStudio](https://github.com/rstudio/master-the-tidyverse). Thanks to [Charlotte](http://cwick.co.nz) and [Garrett](https://github.com/garrettgman) for creating the slides and accompanying materials.