FROM python:3.7.3

WORKDIR /opt/air_tweets

COPY . .

RUN \
     pip install --no-cache-dir -r requirements.txt \
  && mkdir -p /etc/air_tweets \
  && mkdir -p /var/air_tweets \
  && cp config.py-template /etc/air_tweets/config.py

ENV PYTHONPATH .:/etc/air_tweets

VOLUME /etc/air_tweets /var/air_tweets

CMD [ "python", "./tweet.py" ]

