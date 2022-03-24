#!/bin/bash
##  .SYNOPSIS
##  Grafana Dashboard for HPE MSA2050 - Using RestAPI to Telegraf/InfluxDB Script
## 
##  .DESCRIPTION
##  This Script will query the HPE MSA2050 RESTful API to file. Then Telegraf [inputs.file]  
##	
##  .Notes
##  NAME:  get_xml_from_msa.sh
##  ORIGINAL NAME: get_xml_from_msa.sh
##  LASTEDIT: 24/03/2022
##  VERSION: 1.0
##  KEYWORDS: MSA, InfluxDB, Grafana, Telegraf
   
#echo -n zabbix_Zabbix#2022 | sha256sum # 
login=$(echo -n zabbix_Zabbix#2022 | md5sum | awk '{print $1}') # Plain MSA in form login_password 
ua=$(curl -ko -X POST https://<MSA IP>/api/login/$login)
key=$(echo $ua | grep -oPm1 "(?<=<PROPERTY name=\"response\" type=\"string\" size=\"180\" draw=\"true\" sort=\"nosort\" display-name=\"Response\">)[^<]+")
#echo $ua

#echo $key
curl -k -H "sessionKey: $key" -H "dataType: api" https://<MSA IP>/api/show/configuration > /tmp/msa.xml
exit
