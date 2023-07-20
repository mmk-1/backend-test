1. docker pull postgis/postgis:15-3.3
2. docker run --name spotlas -e POSTGRES_PASSWORD=mysecretpassword -d postgis/postgis
3. docker cp spots.sql spotlas:/spots.sql
4. docker exec -ti spotlas psql -U postgres
5. CREATE DATABASE spotlas;
6. \c spotlas
7. CREATE EXTENSION postgis;
8. \i spots.sql;
9. In your local machine: docker cp func1.sql spotlas:/func1.sql
10. In psql in docker container: \i func1.sql
11. SELECT * FROM get_spots();
12. Output is in output1.txt

