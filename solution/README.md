#Tried to run infracloudio/csvserver:latest using following command
 docker run  --detach --name csv_runner infracloudio/csvserver:latest
#Received following error 
error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory

#created a shell script to create inputFile 
#You need to pass one argument which describes about number of elements need to be generated and give all permissions to the file like read/write/delete
chmod 777 gencsv.sh
#For ex:if you want to generate 10 numbers you can pass 10 as argument 
./gencsv.sh 10

#After generating required number of elements in the inputFile You can copy this file to error location file : /csvserver/inputdata with same container name used while running the image
docker container cp inputFile csv_runner:/csvserver/inputdata

#you can start the container after copying the file 
docker container start csv_runner
#the container is started now

#getting shell access of  container
docker exec -it csv_runner bash

#for checking port on which the application is listening i have used lsof command
#As that package is not installed we first need to install it using following command for CentOS
yum install lsof 
#command to check port
lsof -i -P -n


#exiting from container ie stopping the container and deleting it
docker stop csv_runner
docker rm csv_runner

#creating new container with the same image and adding orange border and 9393 port 
docker create -e CSVSERVER_BORDER="Orange"  -p 9393:9300  --name csv_run infracloudio/csvserver:latest

#copying the inputFile to container to avoid the error 
docker container cp inputFile csv_runner:/csvserver/inputdata

#starting the container
docker container start csv_runner

#Successfully accessed the website with number entries and orange border


