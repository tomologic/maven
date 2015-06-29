FROM tomologic/openjfx:8
ENV MAVEN_VERSION 3.3.3

RUN apt-get update && apt-get -y install curl && apt-get clean && rm -f /var/lib/apt/lists/*_dists_*

RUN curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven

CMD ["mvn"]
