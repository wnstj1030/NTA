#!/bin/bash

# Snort 로그 파일 경로
SNORT_LOG_PATH="/var/log/snort/snort.alert.fast"

# 서버 정보
#SERVER_IP=""
#SERVER_PORT=""

# 한 번만 실행되도록 제어 변수
is_executed=false

# Snort 로그 파일을 모니터링하고 특정 메시지가 나타나면 JSON 파일을 서버로 전송
tail -n 0 -F "$SNORT_LOG_PATH" | while read line
do
    # DDoS 공격 감지 메시지에 대한 판별 조건
    if echo "$line" | grep -qi "SYN-Flooding-Detection"; then
        if [ "$is_executed" = false ]; then
            # JSON 파일을 서버로 전송
            curl -X POST -H "Content-Type: application/json" --data-binary '{"type":"synflood", "timestamp":"'$(date -u '+%Y-%m-%dT%H:%M:%SZ')'", "message":"'"$line"'"}' https://3.38.210.145:8080/api
            is_executed=true
        fi
    fi
    if echo "$line" | grep -qi "UDP-Flooding-Detection"; then
        if [ "$is_executed" = false ]; then
            curl -X POST -H "Content-Type: application/json" --data-binary '{"type":"udpflood", "timestamp":"'$(date -u '+%Y-%m-%dT%H:%M:%SZ')'", "message":"'"$line"'"}' http://3.38.210.145:8080/api
            is_executed=true
        fi
    fi
    if echo "$line" | grep -qi "ICMP-Flooding-Detection"; then
        if [ "$is_executed" = false ]; then
            curl -X POST -H "Content-Type: application/json" --data-binary '{"type":"icmpflood", "timestamp":"'$(date -u '+%Y-%m-%dT%H:%M:%SZ')'", "message":"'"$line"'"}' http://3.38.210.145:8080/api
            is_executed=true
        fi
    fi

    # 한 번만 실행되도록 제어 변수가 true이면 스크립트 종료
    if [ "$is_executed" = true ]; then
        exit 0
    fi

done