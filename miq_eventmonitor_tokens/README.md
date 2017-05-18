# MIQ event monitor token flooding

Possible causes:
 - not working event service connection caching (||= connect)
 - repeated testing of event monitor availability - issue at least locally - see
   files above - workers are being restarted very often (reason - memory usage? used 15 oout of 16GB
RAM)

