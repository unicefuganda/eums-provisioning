#!/bin/bash

RAPIDPRO_API_TOKEN=$1
IP=$2

mkdir -p /home/staging-files && cd /home/staging-files

# Create overrides for python settings
echo "RAPIDPRO_LIVE = True" > settings.py
echo "DEBUG = True" >> settings.py
echo "TEMPLATE_DEBUG = False" >> settings.py
echo "RAPIDPRO_API_TOKEN = '${RAPIDPRO_API_TOKEN}'" >> settings.py
echo "DELIVERY_STATUS_CHECK_DELAY = 0" >> settings.py

# Create overrides for javascript settings
echo '{"CONTACT_SERVICE_URL": "http://${IP}:8005/api/contacts/",\n "BACKEND_URLS": {"DISTRIBUTION_REPORT": "/api/distribution-report/",\n "DISTRIBUTION_PLAN": "/api/distribution-plan/",\n"DISTRIBUTION_PLAN_NODE": "/api/distribution-plan-node/",\n"ITEM": "/api/item/",\n"ITEM_UNIT": "/api/item-unit/",\n"CONSIGNEE": "/api/consignee/",\n"DISTRIBUTION_PLAN_LINE_ITEM": "/api/distribution-plan-line-item/",\n"SALES_ORDER": "/api/sales-order/",\n"SALES_ORDER_ITEM": "/api/sales-order-item/",\n"PURCHASE_ORDER": "/api/purchase-order/",\n"PURCHASE_ORDER_ITEM": "/api/purchase-order-item/",\n"CONSIGNEE_PURCHASE_ORDERS": "/api/consignee-purchase-orders/",\n"CONSIGNEE_PURCHASE_ORDER_ITEMS": "/api/consignee-purchase-order-items/",\n"PROGRAMME": "/api/programme/",\n"USER": "/api/user/",\n"RESPONSES": "/api/responses/",\n"STOCK_REPORT": "/api/stock-report/",\n"DISTRIBUTION_PLAN_RESPONSES": "/api/distribution-plan-responses/",\n"DATE_ANSWERS": "/api/date-answers/",\n"IMPORT_SALES_ORDERS": "/api/import-sales-orders/",\n"IMPORT_RELEASE_ORDERS": "/api/import-release-orders/",\n"PERMISSION": "/api/permission"},\n"DISTRICTGEOJSONURL": "http://${IP}/static/app/data/districts.json",\n"DISTRICTJSONURL": "http://${IP}/static/app/data/district_name.json",\n"districtLayerStyle": {"weight": 1,\n"color": "#036E97",\n"fillColor": "#CCE9F4",\n"fillOpacity": 0.2,\n"opacity": 0.7},\n"selectedLayerStyle": {"weight": 1,\n"color": "@brand-primary",\n"fillOpacity": 0.8},\n"IPJSONURL": "http://${IP}/static/app/data/ip.json"}' > staging.json