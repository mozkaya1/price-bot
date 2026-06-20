# Bot Price Check Service for Linux (Daemon) / Amazon && Bol.com
### Files 
**bot-service-price.sh**

```bash
[musti@musti-deputyp25 price-bot]$ ./bot-service-price.sh -h
Usage: ./bot-service-price.sh [options]
Options:
  -u, --url   url         Set URL
  -s, --set   setPrice    Set your threshold alert price 
  -c  --cool  cooldown    Set your check interval (seconds)
  -t  --title product     Dummy Product name to see service name (pliers,oil,filter etc) in linux "ps"
  -h, --help              Show this help message
[musti@musti-deputyp25 price-bot]$ 

```

**all-bot-wrapper-service.sh**
> List all products to be watched -- Amazon/Bol.com 

**bot-price-alert.service** 
> Linux service file. Add it to `/etc/systemd/system/` 

### Linux Service Commands
**status**
```bash
[musti@optiplex7040 go-projects]$ systemctl status bot-price-alert.service 
● bot-price-alert.service - All Bot Price Check Services
     Loaded: loaded (/etc/systemd/system/bot-price-alert.service; enabled; preset: disabled)
     Active: active (running) since Sat 2026-06-20 21:27:13 CEST; 3h 13min ago
 Invocation: 5746f16b8e8d4e66ad141aa8aba48312
   Main PID: 2894001 (all-bot-wrapper)
      Tasks: 11 (limit: 18406)
     Memory: 4.2M (peak: 128M)
        CPU: 15.179s
     CGroup: /system.slice/bot-price-alert.service
             ├─2894001 /bin/bash /home/musti/go-projects/all-bot-wrapper-service.sh
             ├─2894006 sh /home/musti/go-projects/bot-service-price.sh -u https://www.amazon.nl/-/en/gp/product/B01HFAZMDW -s 58 -c 2000 -t amazon_supra_oil_5L
             ├─2894007 sh /home/musti/go-projects/bot-service-price.sh -u https://www.bol.com/nl/nl/p/motorolie-mazda-original-oil-supra-x-0w20-5l/9300000124236320 -s 75 -c 2050 -t bol_supra_5L
             ├─2894008 sh /home/musti/go-projects/bot-service-price.sh -u https://www.amazon.nl/-/en/gp/product/B008BULCAI -s 17 -c 2100 -t amazon_supra_1L
             ├─2894010 sh /home/musti/go-projects/bot-service-price.sh -u https://www.amazon.nl/-/en/gp/product/B00NQZUVRI -s 15 -c 2200 -t amazon_mazda_air
             ├─2894013 sh /home/musti/go-projects/bot-service-price.sh -u https://www.amazon.nl/-/en/gp/product/B07DNHYY8N -s 24 -c 2300 -t amazon_mazda_cabin
             ├─2950682 sleep 2000
             ├─2952448 sleep 2050
             ├─2953929 sleep 2100
             ├─2956723 sleep 2200
             └─2959375 sleep 2300

Jun 20 23:40:41 optiplex7040 all-bot-wrapper-service.sh[2938604]: [2026-06-20 23:40:39] -- No Discount - amazon_supra_oil_5L -- {"url":"https://www.amazon.nl/-/en/gp/product/B01HFAZMDW","price":58,"status":200,"discount":0}
Jun 20 23:43:56 optiplex7040 all-bot-wrapper-service.sh[2939666]: [2026-06-20 23:43:55] -- No Discount - bol_supra_5L -- {"url":"https://www.bol.com/nl/nl/p/motorolie-mazda-original-oil-supra-x-0w20-5l/9300000124236320","price":75,"status":200,"discount":0}
Jun 20 23:47:21 optiplex7040 all-bot-wrapper-service.sh[2940852]: [2026-06-20 23:47:19] -- No Discount - amazon_supra_1L -- {"url":"https://www.amazon.nl/-/en/gp/product/B008BULCAI","price":17,"status":200,"discount":0}
Jun 20 23:54:02 optiplex7040 all-bot-wrapper-service.sh[2943045]: [2026-06-20 23:54:00] -- No Discount - amazon_mazda_air -- {"url":"https://www.amazon.nl/-/en/gp/product/B00NQZUVRI","price":15,"status":200,"discount":0}
Jun 21 00:00:43 optiplex7040 all-bot-wrapper-service.sh[2945742]: [2026-06-21 00:00:40] -- No Discount - amazon_mazda_cabin -- {"url":"https://www.amazon.nl/-/en/gp/product/B07DNHYY8N","price":24,"status":200,"discount":0}
Jun 21 00:14:02 optiplex7040 all-bot-wrapper-service.sh[2950681]: [2026-06-21 00:14:01] -- No Discount - amazon_supra_oil_5L -- {"url":"https://www.amazon.nl/-/en/gp/product/B01HFAZMDW","price":58,"status":200,"discount":0}
Jun 21 00:18:07 optiplex7040 all-bot-wrapper-service.sh[2952447]: [2026-06-21 00:18:06] -- No Discount - bol_supra_5L -- {"url":"https://www.bol.com/nl/nl/p/motorolie-mazda-original-oil-supra-x-0w20-5l/9300000124236320","price":75,"status":200,"discount":0}
Jun 21 00:22:23 optiplex7040 all-bot-wrapper-service.sh[2953928]: [2026-06-21 00:22:21] -- No Discount - amazon_supra_1L -- {"url":"https://www.amazon.nl/-/en/gp/product/B008BULCAI","price":17,"status":200,"discount":0}
Jun 21 00:30:44 optiplex7040 all-bot-wrapper-service.sh[2956722]: [2026-06-21 00:30:42] -- No Discount - amazon_mazda_air -- {"url":"https://www.amazon.nl/-/en/gp/product/B00NQZUVRI","price":15,"status":200,"discount":0}
Jun 21 00:39:05 optiplex7040 all-bot-wrapper-service.sh[2959374]: [2026-06-21 00:39:03] -- No Discount - amazon_mazda_cabin -- {"url":"https://www.amazon.nl/-/en/gp/product/B07DNHYY8N","price":24,"status":200,"discount":0}
[musti@optiplex7040 go-projects]$ 


```
**enable service/Autostart after reboot**
```bash
[musti@optiplex7040 go-projects]$ sudo systemctl enable bot-price-alert.service  --now

```
**stop service**
```bash 
[musti@optiplex7040 go-projects]$ sudo systemctl stop bot-price-alert.service 
[musti@optiplex7040 go-projects]$ sudo systemctl start bot-price-alert.service 

```

### Linux journalctl Logs
```bash
[musti@optiplex7040 go-projects]$ journalctl -u bot-price-alert.service

```

```bash
Jun 20 21:19:59 optiplex7040 all-bot-wrapper-service.sh[2888691]: [2026-06-20 21:19:44] -- No Discount -- {"url":"https://www.bol.com/nl/nl/p/motorolie-mazda-original-oil-supra-x-0w20-5l/9300000124236320","p>
Jun 20 21:20:36 optiplex7040 all-bot-wrapper-service.sh[2891135]: [2026-06-20 21:19:44] -- No Discount -- {"url":"https://www.amazon.nl/-/en/gp/product/B01HFAZMDW","price":58,"status":200,"discount":0}
Jun 20 21:20:36 optiplex7040 all-bot-wrapper-service.sh[2891172]: [2026-06-20 21:19:44] -- No Discount -- {"url":"https://www.amazon.nl/-/en/gp/product/B00NQZUVRI","price":15,"status":200,"discount":0}
Jun 20 21:20:36 optiplex7040 all-bot-wrapper-service.sh[2891176]: [2026-06-20 21:19:44] -- No Discount -- {"url":"https://www.amazon.nl/-/en/gp/product/B07DNHYY8N","price":24,"status":200,"discount":0}
Jun 20 21:20:36 optiplex7040 all-bot-wrapper-service.sh[2891183]: [2026-06-20 21:19:44] -- No Discount -- {"url":"https://www.amazon.nl/-/en/gp/product/B008BULCAI","price":17,"status":200,"discount":0}
Jun 20 21:21:42 optiplex7040 systemd[1]: Stopping All Bot Price Check Services...
Jun 20 21:21:42 optiplex7040 systemd[1]: bot-price-alert.service: Deactivated successfully.
Jun 20 21:21:42 optiplex7040 systemd[1]: Stopped All Bot Price Check Services.
Jun 20 21:21:42 optiplex7040 systemd[1]: bot-price-alert.service: Consumed 2min 5.737s CPU time over 1min 58.711s wall clock time, 2.1G memory peak.
Jun 20 21:26:00 optiplex7040 systemd[1]: Started All Bot Price Check Services.
Jun 20 21:26:02 optiplex7040 all-bot-wrapper-service.sh[2893427]: [2026-06-20 21:26:01] -- No Discount - bol_supra_5L -- {"url":"https://www.bol.com/nl/nl/p/motorolie-mazda-original-oil-supra-x-0w20-5l/93000>
Jun 20 21:26:02 optiplex7040 all-bot-wrapper-service.sh[2893461]: [2026-06-20 21:26:01] -- No Discount - amazon_supra_oil_5L -- {"url":"https://www.amazon.nl/-/en/gp/product/B01HFAZMDW","price":58,"status":2>
Jun 20 21:26:03 optiplex7040 all-bot-wrapper-service.sh[2893477]: [2026-06-20 21:26:01] -- No Discount - amazon_supra_1L -- {"url":"https://www.amazon.nl/-/en/gp/product/B008BULCAI","price":17,"status":200,">
Jun 20 21:26:03 optiplex7040 all-bot-wrapper-service.sh[2893506]: [2026-06-20 21:26:01] -- No Discount - amazon_mazda_vabin -- {"url":"https://www.amazon.nl/-/en/gp/product/B07DNHYY8N","price":24,"status":20>
Jun 20 21:26:03 optiplex7040 all-bot-wrapper-service.sh[2893508]: [2026-06-20 21:26:01] -- No Discount - amazon_mazda_air -- {"url":"https://www.amazon.nl/-/en/gp/product/B00NQZUVRI","price":15,"status":200,>
Jun 20 21:26:48 optiplex7040 systemd[1]: Stopping All Bot Price Check Services...
Jun 20 21:26:48 optiplex7040 systemd[1]: bot-price-alert.service: Deactivated successfully.
Jun 20 21:26:48 optiplex7040 systemd[1]: Stopped All Bot Price Check Services.
Jun 20 21:26:48 optiplex7040 systemd[1]: bot-price-alert.service: Consumed 2.733s CPU time over 47.879s wall clock time, 148.5M memory peak.
Jun 20 21:27:13 optiplex7040 systemd[1]: Started All Bot Price Check Services.
Jun 20 21:27:14 optiplex7040 all-bot-wrapper-service.sh[2894282]: [2026-06-20 21:27:13] -- No Discount - bol_supra_5L -- {"url":"https://www.bol.com/nl/nl/p/motorolie-mazda-original-oil-supra-x-0w20-5l/93000>
Jun 20 21:27:14 optiplex7040 all-bot-wrapper-service.sh[2894317]: [2026-06-20 21:27:13] -- No Discount - amazon_supra_oil_5L -- {"url":"https://www.amazon.nl/-/en/gp/product/B01HFAZMDW","price":58,"status":2>
Jun 20 21:27:14 optiplex7040 all-bot-wrapper-service.sh[2894319]: [2026-06-20 21:27:13] -- No Discount - amazon_supra_1L -- {"url":"https://www.amazon.nl/-/en/gp/product/B008BULCAI","price":17,"status":200,">
Jun 20 21:27:14 optiplex7040 all-bot-wrapper-service.sh[2894336]: [2026-06-20 21:27:13] -- No Discount - amazon_mazda_air -- {"url":"https://www.amazon.nl/-/en/gp/product/B00NQZUVRI","price":15,"status":200,>
Jun 20 21:27:15 optiplex7040 all-bot-wrapper-service.sh[2894352]: [2026-06-20 21:27:13] -- No Discount - amazon_mazda_cabin -- {"url":"https://www.amazon.nl/-/en/gp/product/B07DNHYY8N","price":24,"status":20>
Jun 20 22:00:36 optiplex7040 all-bot-wrapper-service.sh[2905103]: [2026-06-20 22:00:34] -- No Discount - amazon_supra_oil_5L -- {"url":"https://www.amazon.nl/-/en/gp/product/B01HFAZMDW","price":58,"status":2>
Jun 20 22:01:24 optiplex7040 all-bot-wrapper-service.sh[2905464]: [2026-06-20 22:01:24] -- No Discount - bol_supra_5L -- {"url":"https://www.bol.com/nl/nl/p/motorolie-mazda-original-oil-supra-x-0w20-5l/93000>
Jun 20 22:02:16 optiplex7040 all-bot-wrapper-service.sh[2905780]: [2026-06-20 22:02:14] -- No Discount - amazon_supra_1L -- {"url":"https://www.amazon.nl/-/en/gp/product/B008BULCAI","price":17,"status":200,">
Jun 20 22:03:56 optiplex7040 all-bot-wrapper-service.sh[2906337]: [2026-06-20 22:03:54] -- No Discount - amazon_mazda_air -- {"url":"https://www.amazon.nl/-/en/gp/product/B00NQZUVRI","price":15,"status":200,>
Jun 20 22:05:36 optiplex7040 all-bot-wrapper-service.sh[2906979]: [2026-06-20 22:05:35] -- No Discount - amazon_mazda_cabin -- {"url":"https://www.amazon.nl/-/en/gp/product/B07DNHYY8N","price":24,"status":20>
Jun 20 22:33:58 optiplex7040 all-bot-wrapper-service.sh[2916488]: [2026-06-20 22:33:56] -- No Discount - amazon_supra_oil_5L -- {"url":"https://www.amazon.nl/-/en/gp/product/B01HFAZMDW","price":58,"status":2>
Jun 20 22:35:35 optiplex7040 all-bot-wrapper-service.sh[2917108]: [2026-06-20 22:35:34] -- No Discount - bol_supra_5L -- {"url":"https://www.bol.com/nl/nl/p/motorolie-mazda-original-oil-supra-x-0w20-5l/93000>
Jun 20 22:37:18 optiplex7040 all-bot-wrapper-service.sh[2917696]: [2026-06-20 22:37:16] -- No Discount - amazon_supra_1L -- {"url":"https://www.amazon.nl/-/en/gp/product/B008BULCAI","price":17,"status":200,">
Jun 20 22:40:38 optiplex7040 all-bot-wrapper-service.sh[2918863]: [2026-06-20 22:40:36] -- No Discount - amazon_mazda_air -- {"url":"https://www.amazon.nl/-/en/gp/product/B00NQZUVRI","price":15,"status":200,>
Jun 20 22:43:58 optiplex7040 all-bot-wrapper-service.sh[2919962]: [2026-06-20 22:43:56] -- No Discount - amazon_mazda_cabin -- {"url":"https://www.amazon.nl/-/en/gp/product/B07DNHYY8N","price":24,"status":20>
Jun 20 23:07:19 optiplex7040 all-bot-wrapper-service.sh[2927632]: [2026-06-20 23:07:18] -- No Discount - amazon_supra_oil_5L -- {"url":"https://www.amazon.nl/-/en/gp/product/B01HFAZMDW","price":58,"status":2>
Jun 20 23:09:45 optiplex7040 all-bot-wrapper-service.sh[2928489]: [2026-06-20 23:09:45] -- No Discount - bol_supra_5L -- {"url":"https://www.bol.com/nl/nl/p/motorolie-mazda-original-oil-supra-x-0w20-5l/93000>
Jun 20 23:12:19 optiplex7040 all-bot-wrapper-service.sh[2929335]: [2026-06-20 23:12:18] -- No Discount - amazon_supra_1L -- {"url":"https://www.amazon.nl/-/en/gp/product/B008BULCAI","price":17,"status":200,">
Jun 20 23:17:20 optiplex7040 all-bot-wrapper-service.sh[2930998]: [2026-06-20 23:17:18] -- No Discount - amazon_mazda_air -- {"url":"https://www.amazon.nl/-/en/gp/product/B00NQZUVRI","price":15,"status":200,>
Jun 20 23:22:20 optiplex7040 all-bot-wrapper-service.sh[2932658]: [2026-06-20 23:22:18] -- No Discount - amazon_mazda_cabin -- {"url":"https://www.amazon.nl/-/en/gp/product/B07DNHYY8N","price":24,"status":20>
Jun 20 23:40:41 optiplex7040 all-bot-wrapper-service.sh[2938604]: [2026-06-20 23:40:39] -- No Discount - amazon_supra_oil_5L -- {"url":"https://www.amazon.nl/-/en/gp/product/B01HFAZMDW","price":58,"status":2>
Jun 20 23:43:56 optiplex7040 all-bot-wrapper-service.sh[2939666]: [2026-06-20 23:43:55] -- No Discount - bol_supra_5L -- {"url":"https://www.bol.com/nl/nl/p/motorolie-mazda-original-oil-supra-x-0w20-5l/93000>
Jun 20 23:47:21 optiplex7040 all-bot-wrapper-service.sh[2940852]: [2026-06-20 23:47:19] -- No Discount - amazon_supra_1L -- {"url":"https://www.amazon.nl/-/en/gp/product/B008BULCAI","price":17,"status":200,">
Jun 20 23:54:02 optiplex7040 all-bot-wrapper-service.sh[2943045]: [2026-06-20 23:54:00] -- No Discount - amazon_mazda_air -- {"url":"https://www.amazon.nl/-/en/gp/product/B00NQZUVRI","price":15,"status":200,>
Jun 21 00:00:43 optiplex7040 all-bot-wrapper-service.sh[2945742]: [2026-06-21 00:00:40] -- No Discount - amazon_mazda_cabin -- {"url":"https://www.amazon.nl/-/en/gp/product/B07DNHYY8N","price":24,"status":20>
Jun 21 00:14:02 optiplex7040 all-bot-wrapper-service.sh[2950681]: [2026-06-21 00:14:01] -- No Discount - amazon_supra_oil_5L -- {"url":"https://www.amazon.nl/-/en/gp/product/B01HFAZMDW","price":58,"status":2>
Jun 21 00:18:07 optiplex7040 all-bot-wrapper-service.sh[2952447]: [2026-06-21 00:18:06] -- No Discount - bol_supra_5L -- {"url":"https://www.bol.com/nl/nl/p/motorolie-mazda-original-oil-supra-x-0w20-5l/93000>
Jun 21 00:22:23 optiplex7040 all-bot-wrapper-service.sh[2953928]: [2026-06-21 00:22:21] -- No Discount - amazon_supra_1L -- {"url":"https://www.amazon.nl/-/en/gp/product/B008BULCAI","price":17,"status":200,">


```
