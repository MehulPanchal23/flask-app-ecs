
## AS stands for alias >> you can give name to the stage "ex:- AS builder" 
## you can use this image  anywhere inthe docker file using alias

FROM python:3.9-slim AS builder

WORKDIR /app

COPY . .

## pip install -r requirements.txt will install all the requirement mentioned into the requirements.txt and place it into the particular directory.
##Now i want to define that directory as per myself that is why i have used --target=/app/deps 
RUN pip install -r requirements.txt --target=/app/deps

EXPOSE 80

CMD ["python","run.py"]
