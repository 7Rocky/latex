FROM ubuntu:20.04

RUN apt update

RUN ln -fs /usr/share/zoneinfo/Europe/Madrid /etc/localtime
RUN apt install -y tzdata
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN apt install -y texlive-full python3-pygments latexmk

WORKDIR /project

COPY compress /usr/local/bin
COPY bib /usr/local/bin
COPY .latexmkrc /root

CMD cd template && latexmk -pvc -pdf -view=none -silent -time main.tex
