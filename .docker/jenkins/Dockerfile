FROM jenkins/jenkins:lts

# Switch to root
USER root

# Set JENKINS_HOME
ENV JENKINS_HOME /var/jenkins_home

# Install prerequisites
RUN apt-get update && \
    apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        software-properties-common \
        wget

# Install Docker cli
ARG DOCKER_CLI_VERSION==5:20.10.6~3-0~debian-buster
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" &&\
    apt-get update && \
    apt-get install -y docker-ce-cli${DOCKER_CLI_VERSION} && \
    groupadd -r docker && \
    usermod -aG docker jenkins

# Install gosu for a better su+exec command
ARG GOSU_VERSION=1.10
RUN dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" && \
    wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch" && \
    chmod +x /usr/local/bin/gosu && \
    gosu nobody true

# Set custom entrypoint
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Back to the regular jenkins user - good practice
USER jenkins

# Install Jenkins plugins (see https://github.com/jenkinsci/docker#usage-1)
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN xargs /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# To install without banner prompting the user to install additional plugins
# RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
