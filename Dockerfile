FROM rocker/tidyverse:4.2
RUN R -e "install.packages('pak', type = 'source')"
RUN R -e "pak::pkg_install(c('markdown', 'tidymodels', 'usethis', 'devtools'))"