# bash-project

 1. Research and compare free online project management tools and propose one.
 
 2. Set up Virtual Box on your local workstation.

 3. Create 3 individual servers on the same virtual network.

 4. Install the latest version of Postgresql 15 on the first virtual machine.

 5. Install Hasura on the second virtual machine.

 6. Download the passenger list of Titanic and create the required tables on
   the Postgresql database

 7. Configure the Hasura instance to get data from the Postgresql database

 8. Configure API endpoints on the Hasura server to perform SELECT, INSERT, and
   DELETE operations on the Postgresql database.

 9. On the 3rd server, create a bash script to read the passenger list locally
 and perform the following tasks
   a. Read the record from the CSV
   b. Check if that record exists in the database via Hasura APIs
     i. If the record exists, skip
     ii. If the record doesn’t exist INSERT
       1. Check the database to see if the inserted record is the
         same as the local one.
   c. Process the next record
   d. At the end of the process log how many records are processed and how
      many records are inserted into the database. i.e. 90 records
      processed 15 inserted.

 10.On the 3rd server, create another bash script to purge the database tables.
   This can be done via Hasura or direct connection to Postgresql, this is up
   to you.
 
11.Set up the bash scripts as Cron jobs on the 3rd server.
  a. SELECT/INSERT job will run every 15 minutes.
  b. DELETE job will run at every hour
