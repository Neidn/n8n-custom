FROM n8nio/n8n:latest

USER root

# 테스트용 파일 추가
RUN echo "Custom n8n build $(date)" > /tmp/build-info.txt

USER node

ENV CUSTOM_BUILD=true