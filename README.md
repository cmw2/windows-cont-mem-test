# windows-cont-mem-test
A script to test how many containers fit in a P1V3 plan.

The dockerfile was built and pushed to https://hub.docker.com/repository/docker/chwestbr/aspnet-msmq.

The script uses az cli to create:
 - a resource group
 - a P1V3 App Service Plan for windows containers
 - 4 webapps using the above mentioned image.

With a short delay (say 10 seconds) between creating each app the 4th app won't have enough memory to run.  The same is true when creating them manually.  
After a few minutes though the 4th one ususally does manage to start, but it's right on the edge so not completely predictable.

With a long delay (say 5 minutes) between creating each the 4th one usually can run.

In any case we're seeing the containers can use between 3 and 4G of the total 8G of the plan.
