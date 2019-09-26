FROM python:3.6.9-alpine

RUN apk add bash
RUN mkdir /opt/easycla
RUN python3 -m venv /opt/easycla
RUN source /opt/easycla/bin/activate
RUN pip install --upgrade pip
RUN apk add --update git yarn nodejs npm make gcc g++ libxslt-dev
RUN npm install -g serverless@1.32.0
RUN mkdir /opt/communitybridge
RUN cd /opt/communitybridge
RUN git clone https://github.com/communitybridge/easycla.git
RUN cd easycla
RUN yarn install
RUN cd cla-backend 
RUN make setup
