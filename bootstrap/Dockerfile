FROM ruby:2.6.3 
# No need for RVM since the container is already isolated. 
RUN apt-get update -qq && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7 && \
    apt-get install -y apt-transport-https ca-certificates && \
    apt-get install -y default-libmysqlclient-dev default-jdk unzip nodejs php-cli apache2 dirmngr gnupg apache2-dev git wget && \
    sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger bionic main > /etc/apt/sources.list.d/passenger.list' && \
    apt-get update && \
    apt-get install -y libapache2-mod-passenger
RUN apt-get install -y build-essential default-mysql-client

RUN mkdir -p /app && mkdir -p /app/judge && mkdir -p /app/bootstrap
# Installing web application.
WORKDIR /app
RUN git clone -q git://github.com/cafe-grader-team/cafe-grader-web.git web
RUN cp /app/web/config/application.rb.SAMPLE /app/web/config/application.rb && \
    cp /app/web/config/initializers/cafe_grader_config.rb.SAMPLE /app/web/config/initializers/cafe_grader_config.rb && \
    cd web && bundle && \
    rake assets:precompile

# Installing judge scripts.
WORKDIR /app/judge
RUN git clone -q git://github.com/cafe-grader-team/cafe-grader-judge-scripts.git scripts && \
    mkdir raw && mkdir ev-exam && mkdir ev && mkdir result && mkdir log && \
    cp /app/judge/scripts/config/env_exam.rb.SAMPLE /app/judge/scripts/config/env_exam.rb && \
    cp /app/judge/scripts/config/env_grading.rb.SAMPLE /app/judge/scripts/config/env_grading.rb

COPY bootstrap /app/bootstrap
RUN /app/bootstrap/setup-timezone.sh && \
    cp /app/bootstrap/database.yml /app/web/config/database.yml && \
    cp /app/bootstrap/secrets.yml /app/web/config/secrets.yml && \
    # create new environment.rb file
    cp /app/bootstrap/environment.rb /app/judge/scripts/config/environment.rb

# Compiling box
RUN /app/bootstrap/compile-box.sh

WORKDIR /app/web