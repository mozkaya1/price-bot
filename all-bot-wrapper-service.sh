#!/bin/bash

## Add/Remove products according to your interest 
# Run all bot instances
/home/musti/go-projects/bot-service-price.sh -u "https://www.amazon.nl/-/en/gp/product/B01HFAZMDW" -s 58 -c 2000 -t amazon_supra_oil_5L & # Mazda Supra oil 5L
/home/musti/go-projects/bot-service-price.sh -u "https://www.bol.com/nl/nl/p/motorolie-mazda-original-oil-supra-x-0w20-5l/9300000124236320" -s 75 -c 2050 -t bol_supra_5L & # Mazda Supra oil 5L - bol.com
/home/musti/go-projects/bot-service-price.sh -u "https://www.amazon.nl/-/en/gp/product/B008BULCAI" -s 17 -c 2100 -t amazon_supra_1L & # Mazda Supra oil 1L
/home/musti/go-projects/bot-service-price.sh -u "https://www.amazon.nl/-/en/gp/product/B00NQZUVRI" -s 15 -c 2200 -t amazon_mazda_air & # Mazda Air filter
/home/musti/go-projects/bot-service-price.sh -u "https://www.amazon.nl/-/en/gp/product/B07DNHYY8N" -s 24 -c 2300 -t amazon_mazda_cabin & # Mazda Cabin filter

# Wait for all background jobs
wait
