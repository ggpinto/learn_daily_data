'config//parameters.yaml' |>
  yaml::read_yaml() |>
  purrr::pluck("api") |>
  purrr::pluck("url") |>
  jsonlite::fromJSON() |>
  purrr::pluck("result") |>
  purrr::pluck("records") |>
  tibble::as_tibble() |>
  janitor::clean_names() |>
  qs::qsave(paste0("data//", Sys.Date(), ".qs"))