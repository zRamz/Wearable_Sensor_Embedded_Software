#ifndef HTTP_H_
#define HTTP_H_

#include <stdio.h>
#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/timers.h"
#include "freertos/event_groups.h"
#include "esp_wifi.h"
#include "esp_log.h"
#include "nvs_flash.h"
#include "esp_netif.h"
#include "esp_http_client.h"

static void wifi_event_handler(void *event_handler_arg, esp_event_base_t event_base, int32_t event_id, void *event_data);
void wifi_connection();
esp_err_t client_event_post_handler(esp_http_client_event_handle_t evt);
// static void post_rest_function();



#define SSID "Mi"
#define PASS "12345678"

#endif // HTTP_H_