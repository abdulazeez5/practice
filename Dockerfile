# Use the official Jenkins LTS (Long Term Support) image
FROM jenkins/jenkins:lts

# Optional: Install additional packages or dependencies
USER root
RUN apt-get update && apt-get install -y \
    vim \
    git \
    docker.io \
    && rm -rf /var/lib/apt/lists/*

# Switch back to the Jenkins user
USER jenkins

# Expose the default Jenkins port
EXPOSE 8080

# Start Jenkins
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["jenkins.sh"]
