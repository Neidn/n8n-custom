FROM alpine:latest AS builder
RUN apk add --no-cache apk-tools-static

FROM n8nio/n8n:latest
USER root

COPY --from=builder /sbin/apk.static /sbin/apk

RUN apk add --no-cache --allow-untrusted \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    font-noto-cjk

# Puppeteer skip 내장 chromium 설치, 시스템 chromium 사용 설정
#ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
#    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# 4. n8n 커뮤니티 노드 설치

RUN npm install otplib request -g

USER node