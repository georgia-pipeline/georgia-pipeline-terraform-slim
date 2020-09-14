FROM alpine
ARG terraform_version="0.13.2"
ARG kubectl_version="1.19.0"
RUN wget -O /tmp/terraform.zip "https://releases.hashicorp.com/terraform/${terraform_version}/terraform_${terraform_version}_linux_amd64.zip"
RUN unzip /tmp/terraform.zip -d /bin/
RUN chmod +x /bin/terraform
RUN apk add --no-cache jq curl
RUN curl -sLo /usr/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/v${kubectl_version}/bin/linux/amd64/kubectl"
RUN chmod +x /usr/bin/kubectl

RUN apk add --no-cache ca-certificates git
RUN mkdir -p "$HOME/.terraform.d/plugins"

#COPY run.sh /
#RUN chmod +x /run.sh
#ENTRYPOINT ["/run.sh"]
