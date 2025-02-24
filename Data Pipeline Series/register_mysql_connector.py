import requests
import json

# Define the connector configuration
connector_config = {
    "name": "mysql-connector",
    "config": {
        "connector.class": "io.debezium.connector.mysql.MySqlConnector",
        "tasks.max": "1",
        "database.hostname": "mysql",
        "database.port": "3306",
        "database.user": "testuser",
        "database.password": "testpassword",
        "database.server.id": "223344",
        "database.include.list": "testdb",
        "database.server.name": "dbserver1",
        "database.allowPublicKeyRetrieval": "true",
        "schema.history.internal.kafka.bootstrap.servers": "kafka:9092",
        "schema.history.internal.kafka.topic": "schema-changes.testdb",
        "topic.prefix": "dbserver1",
        "table.include.list": "testdb.testtable",
        "include.schema.changes": "true",
        "transforms": "route",
        "transforms.route.type": "org.apache.kafka.connect.transforms.RegexRouter",
        "transforms.route.regex": ".*",
        "transforms.route.replacement": "dbserver1.testdb.testtable",
        "database.history.kafka.recovery.poll.interval.ms": "1000",
        "database.history.kafka.recovery.attempts": "3",
    },
}

# Define the URL and headers for the POST request
url = "http://localhost:8083/connectors"
headers = {"Content-Type": "application/json"}

# Send the POST request to register the connector
response = requests.post(url, headers=headers, data=json.dumps(connector_config))

# Check the response status code
if response.status_code == 201:
    print("Connector registered successfully!")
elif response.status_code == 409:
    print("Connector already exists!")
else:
    print(f"Failed to register connector: {response.status_code}")
    print(response.text)
