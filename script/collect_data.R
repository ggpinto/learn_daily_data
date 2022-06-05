collected_data <- 'config//parameters.yaml' |>
  yaml::read_yaml() |>
  purrr::pluck("api") |>
  purrr::pluck("url") |>
  jsonlite::fromJSON() |>
  purrr::pluck("result") |>
  purrr::pluck("records") |>
  tibble::as_tibble() |>
  janitor::clean_names()

board <- pins::board_folder("data")

pins::pin_write(board, collected_data, type = "qs")