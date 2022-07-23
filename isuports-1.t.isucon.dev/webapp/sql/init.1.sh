#!/bin/sh

set -x
cd `dirname $0`

ISUCON_DB_HOST=192.168.0.11
ISUCON_DB_PORT=${ISUCON_DB_PORT:-3306}
ISUCON_DB_USER=${ISUCON_DB_USER:-isucon}
ISUCON_DB_PASSWORD=${ISUCON_DB_PASSWORD:-isucon}
ISUCON_DB_NAME=${ISUCON_DB_NAME:-isuports}

# MySQLを初期化
mysql -u"$ISUCON_DB_USER" \
                -p"$ISUCON_DB_PASSWORD" \
                --host "$ISUCON_DB_HOST" \
                --port "$ISUCON_DB_PORT" \
                "$ISUCON_DB_NAME" < init.sql

# add/remove index
mysql -u"$ISUCON_DB_USER" -p"$ISUCON_DB_PASSWORD" --host "$ISUCON_DB_HOST" --port "$ISUCON_DB_PORT" "$ISUCON_DB_NAME" \
  -e 'ALTER TABLE visit_history ADD INDEX tenant_competition_player (tenant_id,competition_id,player_id);'

mysql -u"$ISUCON_DB_USER" -p"$ISUCON_DB_PASSWORD" --host "$ISUCON_DB_HOST" --port "$ISUCON_DB_PORT" "$ISUCON_DB_NAME" \
  -e 'DROP INDEX tenant_id_idx ON visit_history;'


