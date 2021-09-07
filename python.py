# logging
import logging
logging.basicConfig(filename='demo-app.log', format='%(asctime)s:%(levelname)s:%(funcName)s:%(message)s')
logging.error('failed to connect')
