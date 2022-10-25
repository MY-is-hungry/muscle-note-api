FROM ruby:3.1.1

ENV APP_PATH /api

RUN apt-get update -qq && apt-get install -y default-mysql-client && apt-get install -y vim

# Node.js LTS (v16.x)
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && apt-get install -y nodejs

RUN mkdir $APP_PATH
WORKDIR $APP_PATH
COPY Gemfile $APP_PATH/Gemfile
COPY Gemfile.lock $APP_PATH/Gemfile.lock
RUN bundle install

COPY . $APP_PATH

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]