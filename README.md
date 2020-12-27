# airtable-cdc-kafka

A CDC (Change data capture) for Airtable into Kafka.   
Each modified row of the spreadsheet creates a message into a Kafka topic.

Kafka Connect with this [HTTP Connector](https://github.com/castorm/kafka-connect-http) scrapes regularly the [Airtable API](https://airtable.com/api) for modified records (rows)

Two fields are needed into the spreadsheet:

* **Done**, type Checkbox
* **updated_at**, type Formula, `LAST_MODIFIED_TIME()`

![](https://docuver.se/airtable-cdc-kafka.jpg)

Usage:

* Modify **conf/airtable.properties** with the API Token and your table URL and tweak `http.timer.interval`
* Start the stack: ```docker-compose up -d```

* Watch (consume) messages ([kaf](https://github.com/birdayz/kaf))

    ```kaf -b 192.168.0.100:9094 consume airtable```