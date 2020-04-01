# DSAID Data Engineering Technical Test


## Section 1: Data Pipelines

Run `$ python scheduler.py ` inside section_1_data_pipelines directory first to set up the cron job for the Linux machine. (Note: I am currently quarantined at a hotel and 
do not have access to a Linux terminal. Hence, I was unable to test and debug the cron job even though I managed to test the rest of my code using Windows Scheduling)

Once the job is run at 1 am, process_data.py would run as it retrieves the updated dataset.csv from the raw_data directory before processing it to the desired 
structure and writing it to the processed_data directory. The date of processing would also be appended to the end of the file name for documentation purposes.

## Section 2: Databases

Run the following code inside the section_2_databases directory:
``` 
$ docker build -t car-db-image . 
$ docker run -d --name car-db-container -p 5555:5432 car-db-image
$ docker container start car-db-container
```
Following which, the car_db Postgres database should be up. You can use DBeaver of PgAdmin to connect to the database. You should use localhost and Port 5555. Take note that the
username and password are both postgres in this case.

Once you are done with using the Postgres database in the Docker container, you can stop the container with the following code:
```
$ docker stop car-db-container
```
You can always set it up again by running the third line of code in the first code block. 


The init.sql in the section_2_databases directory is the file which the tables in the car_db database is built around. It contains SQL instructions on the fields for the different
database objects as well as their relationships with each other. The Entity Relationship Diagram also details the relationships between the entities as well as the one-to-many relationships
between them.

## Section 3: System Design

The pyramid_diagram.png details the layers in the system architecture while the architecture_diagram shows how the different modules are connected in the architecture. 
The architecture_report discusses the assumptions made as well as the key guiding principles behind the design of this cloud architecture.