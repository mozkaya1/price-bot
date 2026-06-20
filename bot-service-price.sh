#!/bin/env sh 

## Set alert price threhold. If price below that threhold alarm will be triggered. -- Only Euro. Not cent --
setPrice=50

## Set Amazon url to be watching -- 
url="https://www.amazon.com/TwinGrip-Pliers-Comfort-Grip-8-inch/dp/B097C7W2YK"

## Set reasonable interval for price check 
cooldown=3600

## Log writer function for better output
log_write() {
    local message="$1"
    local message2="$2"
    echo "[$timestamp] -- $message -- $message2" 
}

usage() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -u, --url   url         Set URL"
    echo "  -s, --set   setPrice    Set your threshold alert price "
    echo "  -c  --cool  cooldown    Set your check interval (seconds)"
    echo "  -t  --title product     Dummy Product name to see service name (pliers,oil,filter etc)"
    echo "  -h, --help              Show this help message"
    exit 1
}


while [[ $# -gt 0 ]]; do
    case $1 in
        -u|--url)
            url="$2"
            shift 2
            ;;
        -s|--set)
            setPrice="$2"
            shift 2
            ;;
        -c|--cool)
            cooldown="$2"
            shift 2
            ;;
        -t|--title)
            title="$2"
            shift 2
            ;;
        -h|--help)
            usage
            ;;
        *)
            echo "Unknown option: $1"
            usage
            ;;
    esac
done

## Infinite loop for checking price ---
while true ;do
timestamp=$(date '+%Y-%m-%d %H:%M:%S')

if echo ${url} | grep -iq "bol" ; then
    cd /home/musti/go-projects/bol/
elif echo ${url} | grep -iq "amazon"; then
    cd /home/musti/go-projects/amazon/
else 
    log_write "${title} - Wrong URL" "${url}"
    exit 7
    fi
## Get Price of the product with Go Code -- 
output=`go run main.go -set $setPrice -url ${url}`


## split variables from output
status=`echo "${output}"|jq -r .status`
price=`echo "${output}"|jq -r .price`
url=`echo "${output}"|jq -r .url`
discount=`printf "%.0f\n" $(echo ${output}|jq -r .discount)`


if [[ $status == 200 && $discount != 0 && $price != 0 ]]; then

  message="$timestamp - Amazon Discount Alert - % $discount -- $url" 
  setPrice=$price

  #send Telegram Notification with Python Code
  python /home/musti/python-project-server/telegram_v3.py "${message}" >/dev/null

  ## send mail notification 
  # echo "${message}" | mail -s "Amazon Discount Alert"  -r RECEIVER@hotmail.com
  log_write "Price dropped - % ${discount} --> ${title} - ${url}"|tee -a amazon.log
  continue
else
log_write "No Discount - ${title}" ${output}|tee -a amazon.log
fi

sleep $cooldown
done
