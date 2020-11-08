#running container in background
 docker run  --detach --name csv_rn infracloudio/csvserver:latest

#getting error 2020/11/08 09:40:32 error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory

#created a shell script to create inputFile 
./gencsv.sh

#copy the inputfile to container as inputdata
docker container cp inputdata.csv csv_rn:/csvserver/inputdata

#getting into docker container cli here container name is csv_rn
docker exec -it csv_rn bash

#getting listener port on container
docker container port csv_rn

#for changing the listening port
#stop the container 
 docker container stop csv_rn
 docker commit csv_rn csv_exe 
docker run -e CSVSERVER_BORDER="Orange"  -p 9300:9393  --detach --name csv_exe infracloudio/csvserver:latest


 
