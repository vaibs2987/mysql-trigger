# mysql-trigger
This is a bash script for generating update trigger for a table.

This script required the database name and table names as parameter.

Also update the username and password while using it.

For audit purpose I have created a table named audit.

create table audit(id bigint(20)  NOT NULL AUTO_INCREMENT,
note varchar(10),
field varchar(100),
orig_value varchar(100),
new_value varchar(100),
date datetime,
PRIMARY KEY (id)
) ENGINE=InnoDB;

So this will have all the incremental changes ie past changes.

If you are adding a new column to a table then drop the previous trigger and create a new trigger.
