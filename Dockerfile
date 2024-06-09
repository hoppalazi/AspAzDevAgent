FROM mcr.microsoft.com/dotnet/sdk:8.0.301-noble-amd64

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
    curl \
    git \
    gpg \
    jq \
    unzip \
    wget

# Set environment variable
# Set the ACCEPT_EULA variable to Y value to confirm your acceptance of the End-User Licensing Agreement
# Can be 'linux-x64', 'linux-arm64', 'linux-arm', 'rhel.6-x64'.
ENV ACCEPT_EULA=Y \
    TARGETARCH=linux-x64

WORKDIR /azp

COPY ./start.sh .
RUN chmod +x start.sh

ENTRYPOINT [ "./start.sh" ]
