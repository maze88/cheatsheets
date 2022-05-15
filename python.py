# logging
import logging
logging.basicConfig(filename="app.log", format="%(asctime)s:%(levelname)s:%(funcName)s:%(message)s")
logging.error("failed to connect")

# ip address validation
import ipaddress
ipaddress.ip_address("${ip}")
