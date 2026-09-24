FROM ruby:3.1.5-slim

ENV RAILS_ENV=production
ENV SECRET_KEY_BASE=dummy_secret
ENV NODE_ENV=production

ENV FEATURES=tools,fieri,announcement,github,no_crawl

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
    git \
    curl \
    postgresql-client \
    pkg-config \
    libyaml-dev \
    libxml2-dev \
    libxslt-dev \
    libarchive-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# We need to clone the specific version since it builds from source
RUN git clone https://github.com/chef/supermarket.git /tmp/supermarket && \
    git -C /tmp/supermarket checkout 95f7060818fedb049a77d84d81bdb2e5fb3a79ed && \
    mv /tmp/supermarket/src/supermarket/* /app/ && \
    rm -rf /tmp/supermarket

RUN gem install bundler -v 2.3.26 && \
    bundle config set --local jobs 1 && \
    bundle config set --local build.nokogiri --use-system-libraries && \
    MAKE="make -j1" MAKEFLAGS="-j1" bundle install --without test development

RUN npm install


# Ensure dummy database settings so assets precompile doesn't crash on connecting to prod db
RUN cp config/database.yml.example config/database.yml || true
RUN echo "DUMMY_VAR=1" > .env && \
    sed -i "s/config.assets.js_compressor = :uglifier/# config.assets.js_compressor = :uglifier/" config/environments/production.rb && \
    bundle exec rake assets:precompile

COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 80

CMD ["/usr/local/bin/entrypoint.sh"]
