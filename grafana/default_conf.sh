#!/bin/bash

# Данный скрипт создает папки и базовые конфиги в них для работы стека Grafana + Loki + Promtail + Telegraf
# В будущем вместо этого будет ansible плейбук

dir_list="loki promtail"
for dir in $dir_list; do

    mkdir -p /etc/$dir

done
rsync -av build_files/promtail-config.yaml /etc/promtail/promtail-config.yaml
rsync -av build_files/loki-config.yaml /etc/loki/loki-config.yaml
