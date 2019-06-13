FROM ruby:2.4

ENV APP_HOME /opt/vagas/devops/
ENV HOME /root
ENV LOGDIR /var/log/unicorn
WORKDIR $APP_HOME
ENV PORT 80

RUN apt-get update && \
  apt-get install -y net-tools nginx && \
  rm -rf /etc/nginx/sites-enabled/default && \
  mkdir -p $APP_HOME $LOGDIR

COPY devops /etc/nginx/sites-available/

COPY . $APP_HOME

RUN bundle install &&\
  ln -s /etc/nginx/sites-available/devops /etc/nginx/sites-enabled/ && \
  chmod +x /opt/vagas/devops/start-app.sh

EXPOSE 80
ENTRYPOINT ["/opt/vagas/devops/start-app.sh"]