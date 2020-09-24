Create nexus data directory directory 

`mkdir /opt/nexus3`

Change owner to nexus user (id=200)

`chown 200 /opt/nexus`

# Create docker regestry

login

Create docker hosted repository.

Change HTTP port for docker repo to 8123

Create role woth docker permission

Create user with docker role

On client

docker login -u {{ username }} -p {{ password }} localhost:8123

docker tag nginx:latest localhost:8123/my_nginx:latest

docker push localhost:8123/my_nginx:latest
