FROM rocker/tidyverse:4.2
ENV DISABLE_AUTH=true
RUN apt-get update -y
RUN R -e "install.packages('pak', type = 'source')"
RUN R -e "pak::pkg_install(c('markdown', 'tidymodels', 'usethis', 'devtools'))"
EXPOSE 8787