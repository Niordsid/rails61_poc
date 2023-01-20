FROM ruby:2.7.5

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
      apt-utils \
      libmagickwand-dev \
      imagemagick \
      libmagickcore-dev \
      qpdf \
      postgresql \
      unixodbc \
      unixodbc-dev \
      ca-certificates \
      bzip2 \
      curl \
      libfontconfig \
      xvfb \
      wkhtmltopdf \
      zip \
    && rm -rf /var/lib/apt/lists/*

# Add Node.js to sources list
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -

# Install Node.js version that will enable installation of yarn
RUN apt-get install -y --no-install-recommends \
    nodejs \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN npm install -g yarn


RUN mkdir /horizontal_sharding_poc
WORKDIR /horizontal_sharding_poc
ADD Gemfile /horizontal_sharding_poc/Gemfile
ADD Gemfile.lock /horizontal_sharding_poc/Gemfile.lock
RUN gem install bundler:2.3.4
RUN bundle install
ADD . /horizontal_sharding_poc

RUN bundle exec rails webpacker:install

EXPOSE 3000
CMD ["bash"]