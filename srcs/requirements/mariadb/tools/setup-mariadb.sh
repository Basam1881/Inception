
#!/bin/bash
mysql < /tmp/create-wpdb.sql;
exec $@;
