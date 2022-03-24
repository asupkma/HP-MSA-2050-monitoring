# HP-MSA-2050-monitoring
HP MSA 2050 monitoring via bash telegraf influx grafana
# Installation
`get_xml_from_msa.sh` to get xml from MSA
Edit telegraf.conf with
```
[[inputs.file]]
  files = ["/tmp/msa.xml"]
  data_format = "xml"

  [[inputs.file.xml]]
    metric_selection = "//OBJECT"
    metric_name = "string('msa')"

    [inputs.file.xml.tags]
    obj_oid = "number(/@oid)"

    [inputs.file.xml.fields]
name = "string(/@name)"
elem = "string(/PROPERTY[@name])"
wbl = "number(/PROPERTY[@name='blink'])"
#health-numeric = "string(/PROPERTY[@name='health-numeric'])"
health-numeric = "number(/PROPERTY[@name='health-numeric'])"
#status = "string(/PROPERTY[@name='status'])"
#locator-led = "string(/PROPERTY[@name='locator-led'])"   locator-led-numeric
locator-led-numeric = "string(/PROPERTY[@name='locator-led-numeric'])"
temperature = "string(/PROPERTY[@name='temperature'])"
temperature-numeric = "number(/PROPERTY[@name='temperature-numeric'])"
#type = "string(/PROPERTY[@name='type'])"
size = "string(/PROPERTY[@name='size'])"
wdescription = "string(/PROPERTY[@name='description'])"
#interface = "string(/PROPERTY[@name='interface'])"
redundancy-status-numeric = "number(/PROPERTY[@name='redundancy-status-numeric'])"
wcontroller-a-status-numeric = "number(/PROPERTY[@name='controller-a-status-numeric'])"
wcontroller-b-status-numeric = "number(/PROPERTY[@name='controller-b-status-numeric'])"
location = "string(/PROPERTY[@name='location'])"
status-numeric = "number(/PROPERTY[@name='status-numeric'])"
speed = "number(/PROPERTY[@name='speed'])"
status-ses-numeric = "number(/PROPERTY[@name='status-ses-numeric'])"
```
Then use grafana dashboard from influx data source

Best regards, Maxim Kisselyov
