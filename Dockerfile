FROM hypriot/rpi-ruby

RUN mkdir /opt/test

# gem cache
WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

# rails
ADD . /opt/test
WORKDIR /opt/test
RUN RAILS_ENV=production bundle exec rake assets:precompile --trace
CMD ["rails","server","-b","0.0.0.0"]
