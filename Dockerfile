FROM python:slim

WORKDIR /docs
RUN apt-get update \
 && apt-get install --no-install-recommends -y \
    fonts-open-sans \
    ghostscript \
    graphviz \
    imagemagick \
    make \
    latexmk \
    lmodern \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-font-utils \
    texlive-lang-cjk \
    texlive-lang-japanese \
    texlive-luatex \
    texlive-xetex \
 && apt-get autoremove \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --no-cache-dir -U pip
RUN python3 -m pip install --no-cache-dir Sphinx==3.4.3 Pillow

CMD ["make", "latexpdf"]