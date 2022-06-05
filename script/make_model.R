library(magrittr)

car_mod <-
  workflows::workflow(mpg ~ ., parsnip::linear_reg()) %>%
  parsnip::fit(mtcars)

v <- vetiver::vetiver_model(car_mod, "cars_mpg")

model_board <- pins::board_folder("data", versioned = TRUE)

model_board %>% vetiver::vetiver_pin_write(v)

vetiver::vetiver_write_plumber(model_board, "cars_mpg", file = "plumber.R")

plumber::pr() %>%
  vetiver::vetiver_api(v) %>%
  vetiver::vetiver_write_docker()