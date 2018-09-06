# Elixir + Phoenix

FROM elixir:1.7

# Install debian packages
RUN apt-get update
RUN apt-get install --yes build-essential inotify-tools postgresql-client

RUN mix local.hex --force \
 && mix archive.install --force  https://github.com/phoenixframework/archives/raw/master/phx_new-1.3.3.ez \
 && apt-get update \
 && curl -sL https://deb.nodesource.com/setup_8.x | bash \
 && apt-get install -y apt-utils \
 && apt-get install -y nodejs \
 && apt-get install -y inotify-tools \
 && mix local.rebar --force

# Install node
# RUN curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
# RUN bash nodesource_setup.sh
# RUN apt-get install nodejs

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

EXPOSE 4000

# CMD ["mix", "phx.server"]