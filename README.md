A-Ti-at-Schools
---

這是用來解析教育替代役歷梯次有哪些學校有開缺，用來輔助推測最近又會有哪些學校有開缺，以方便準備事前學校情報搜集的相關功課。

目前有將結果整理到 Google Sheet 上，並進行顏色格式的設定，可參見[教育服務役各單位歷梯開缺表](https://docs.google.com/spreadsheets/d/1CracTOGv0OV5hJ2a4y7Zl4hTsSWUV8mH6iblbN1l6IY/edit#gid=1255106104)。


> 教育替代役將於 2017 年 01 月 01 日起，正式走入尾聲，之後就不會再徵招替代役了，所以本專案也即將封存。若有想要貢獻此程式，請自行分叉進行開發與維護。

> 由於本程式相依於[教育服務役網站](https://smsedu.moe.gov.tw/)，若該網站將各梯的 xls 檔案刪除，那本程式也就無法使用該梯次的資訊做解析。

## 使用說明

```sh
# 下載檔案
ruby file.rb

# 將 xls 檔案轉換成程式易讀的 csv 格式
ruby file_converter.rb

# 解析下載並轉換完成的 csv 檔案，
# 並將成果輸出為 output.csv
ruby main.rb
```