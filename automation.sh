#!/bin/bash

tempdirpath=`mktemp -d -t tempdir.XXXXXX`

cp -r ./static ./templates ./desafio2_app.py $tempdirpath

touch $tempdirpath/Dockerfile 

echo -e \

"FROM python\n\ 

COPY ./static /home/myapp/static/\nCOPY ./templates /home/myapp/templates/\n\

COPY ./desafio2_app.py /home/myapp/desafio2_app.py\n\
  
RUN pip install flask\n\

EXPOSE 5050\n\

CMD python3 /home/myapp/desafio2_app.py" >> $tempdirpath/Dockerfile

docker build -t desafio-2 $tempdirpath  

docker run -t -d -p 5050:5050 --name temprunning desafio-2

docker ps -a




