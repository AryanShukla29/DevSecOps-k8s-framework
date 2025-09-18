FROM jenkins/jenkins:lts-jdk17
 
# Skip setup wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
 
# Install plugins
COPY jenkins/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt
 
# Copy JCasC config
COPY jenkins/casc_configs/jenkins.yaml /var/jenkins_home/casc_configs/jenkins.yaml
ENV CASC_JENKINS_CONFIG=/var/jenkins_home/casc_configs/jenkins.yaml