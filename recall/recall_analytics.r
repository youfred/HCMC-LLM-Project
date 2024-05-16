# 필요한 라이브러리
library(dplyr)
library(stringr)


# 리콜 사례 걸러내기
korea_car_recall <- read.csv("한국교통안전공단_자동차 리콜대수 및 시정률 - 한국교통안전공단_자동차 .csv")
recall_reason <- read.csv("recall_reasons - recall_reasons_categorized.csv")

korea_car_recall %>% summary()
korea_car_recall %>% tail()
regexpr('현대', korea_car_recall$제작자) > 0
hdai_korea_car_recall <- korea_car_recall %>% 
  filter(regexpr('현대', korea_car_recall$제작자) > 0)
hdai_korea_car_recall$차명 %>% table() %>% sort()

hdai_korea_car_recall %>% nrow()
# 251개

korea_car_recall %>% 
  filter(regexpr('불량', korea_car_recall$리콜사유) < 0) %>% 
  nrow()
# 8747

recall_reason %>% 
  filter(regexpr('불량', recall_reason$리콜사유) < 0) %>% 
  nrow()
# 1870
recall_reason %>% 
  filter(regexpr('불량', recall_reason$리콜사유) > 0, )

## 현대차
hdai_korea_car_recall %>% 
  filter(regexpr('불량', hdai_korea_car_recall$리콜사유) < 0) %>% 
  nrow()
# 179개

hdai_korea_car_recall %>% 
  filter(regexpr('결함', hdai_korea_car_recall$리콜사유) > 0, hdai_korea_car_recall$리콜대수 > 100) %>% 
  nrow()
# 54개
# 45개 - 리콜대수가 100대 초과 