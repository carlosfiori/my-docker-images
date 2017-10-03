# Example for use:
# ---------------
```yaml
version: '3'

services:
   devapp:
     restart: unless-stopped
     depends_on:
       - oracledb
     image: carlosfiori/php7.1-with-oracle
     links:
      - oracledb
     volumes:
      - ./:/root/app
     ports:
      - "8081:8000"

volumes:
    www:
```
# ---------------