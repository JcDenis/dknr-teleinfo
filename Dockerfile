
# Use fix Node-red docker release
FROM nodered/node-red:5.0

# Switch to root user
USER root

# Install usermod
RUN apk add shadow runuser

# Add node red user to dialout group to access to USB port
RUN usermod -aG dialout node-red

# Set environment variables
ENV DKNR_USERNAME=admin \
	DKNR_PASSWORD=admin \
	DKNR_SECRET=dkteleinfo \
    NODE_RED_ENABLE_PROJECTS=true \
	TZ=Europe\Paris

# Image label
LABEL "org.opencontainers.image.authors"="Jean-Christian Paul Denis" \
    "org.opencontainers.image.source"="https://github.com/JcDenis/dknr-teleinfo" \
    "org.opencontainers.image.description"="Teleinfo Parser with web UI and MQTT" \
    "org.opencontainers.image.licenses"="AGPL-3.0"


# Set system timezone
RUN echo "$TZ" > /etc/timezone

# Prepare Node-Red structure
RUN mkdir -p /data/projects/dknr-teleinfo
COPY data /data
COPY flows /flows
COPY config-nodes.json /config-nodes.json
COPY flow-manager-cfg.json /flow-manager-cfg.json
COPY flow-manager-nodes-order.json /flow-manager-nodes-order.json
COPY flows.json /flows.json
COPY flows_cred.json /flows_cred.json
COPY package.json /package.json
COPY package.json /data/package.json

# Fix ownership
RUN chown -R node-red:node-red /data

# Set working diretory for container starting script
WORKDIR /data

# Add container starting script
ADD docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]