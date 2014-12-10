#!/bin/bash

RAPIDPRO_API_TOKEN=$1
IP=$2
MAILGUN_API_KEY=$3

mkdir -p /home/staging-files && cd /home/staging-files

# Create overrides for python settings
echo "RAPIDPRO_LIVE = True" > settings.py
echo "DEBUG = True" >> settings.py
echo "TEMPLATE_DEBUG = False" >> settings.py
echo 'RAPIDPRO_API_TOKEN = "'${RAPIDPRO_API_TOKEN}'"' >> settings.py
echo "DELIVERY_STATUS_CHECK_DELAY = 0" >> settings.py
echo 'MAILGUN_ACCESS_KEY = "'${MAILGUN_API_KEY}'"' >> settings.py

# Create overrides for javascript settings
echo '{"CONTACT_SERVICE_URL": "http://'${IP}':8005/api/contacts/", "BACKEND_URLS": {"DISTRIBUTION_REPORT": "/api/distribution-report/", "DISTRIBUTION_PLAN": "/api/distribution-plan/","DISTRIBUTION_PLAN_NODE": "/api/distribution-plan-node/","ITEM": "/api/item/","ITEM_UNIT": "/api/item-unit/","CONSIGNEE": "/api/consignee/","DISTRIBUTION_PLAN_LINE_ITEM": "/api/distribution-plan-line-item/","SALES_ORDER": "/api/sales-order/","SALES_ORDER_ITEM": "/api/sales-order-item/","PURCHASE_ORDER": "/api/purchase-order/","PURCHASE_ORDER_ITEM": "/api/purchase-order-item/","CONSIGNEE_PURCHASE_ORDERS": "/api/consignee-purchase-orders/","CONSIGNEE_PURCHASE_ORDER_ITEMS": "/api/consignee-purchase-order-items/","PROGRAMME": "/api/programme/","USER": "/api/user/","RESPONSES": "/api/responses/","STOCK_REPORT": "/api/stock-report/","DISTRIBUTION_PLAN_RESPONSES": "/api/distribution-plan-responses/","DATE_ANSWERS": "/api/date-answers/","IMPORT_SALES_ORDERS": "/api/import-sales-orders/","IMPORT_RELEASE_ORDERS": "/api/import-release-orders/","PERMISSION": "/api/permission"},"DISTRICTGEOJSONURL": "http://'${IP}'/static/app/data/districts.json","DISTRICTJSONURL": "http://'${IP}'/static/app/data/district_name.json","districtLayerStyle": {"weight": 1,"color": "#036E97","fillColor": "#CCE9F4","fillOpacity": 0.2,"opacity": 0.7},"selectedLayerStyle": {"weight": 1,"color": "@brand-primary","fillOpacity": 0.8},"IPJSONURL": "http://'${IP}'/static/app/data/ip.json"}' > staging.json
