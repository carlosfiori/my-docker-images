---------------
# Connection info:
SID: XE
USER: user_db
PASSWORD: 1234
PORT: 1521
DATABASE: database
---------------
# Example for use:

```yaml
version: '3'

services:
   oracledb:
     image: carlosfiori/oracle-xe-11g
     restart: always
     environment:
      - ORACLE_ALLOW_REMOTE=true
      - ORACLE_ENABLE_XDB=true
      - ORACLE_DISABLE_ASYNCH_IO=true
     ports:
      - "1521:1521"
      - "49160:22"

volumes:
    www:

```
---------------