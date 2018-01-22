#!/bin/sh

db="$1";
shift

echo "DELIMITER \$\$"
for table in "$@"
do
sql="show columns from $db.$table"
columns=`mysql -u username -ppassword -e  "$sql" | cut -f 1`
echo "CREATE TRIGGER ${table}_log"
echo "AFTER UPDATE ON $table"
echo "FOR EACH ROW BEGIN"

for column in $columns
do
#For neglecting first element
if [ "$column" != 'Field' ]; then
echo " IF !(OLD.$column <=> NEW.$column ) THEN"
#aduit table
echo " INSERT INTO audit(note, field, orig_value, new_value, date)"

echo " VALUES (\"Update\", \"$column\", OLD.$column, NEW.$column, NOW());"
echo " END IF;"
fi
done
echo "END\$\$"
done
