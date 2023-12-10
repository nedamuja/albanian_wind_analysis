FROM python:3.8

# Set the working directory in the container
WORKDIR /code

# Install GDAL dependencies
RUN apt-get update && apt-get install -y \
    libgdal-dev \
    && rm -rf /var/lib/apt/lists/*


COPY /home/ubuntu/testtt.csv /code/testtt.csv
COPY /home/ubuntu/substationsPowesAlti.csv /code/substationsPowesAlti.csv
COPY /home/ubuntu/power_curves.csv /code/power_curves.csv

RUN apt-get update
RUN apt-get install -y gdal-bin libgdal-dev g++


COPY ./requirements.txt /code/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the rest of your application
COPY ./app.py /code/app.py

# Run app.py when the container launches
CMD ["python", "app.py"]
