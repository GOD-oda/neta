FROM amazon/aws-lambda-nodejs:14

# install serverless
RUN curl -sL https://rpm.nodesource.com/setup_14.x | bash - \
  && yum -y install nodejs && yum -y clean all \
  && npm install -g serverless

ENTRYPOINT []