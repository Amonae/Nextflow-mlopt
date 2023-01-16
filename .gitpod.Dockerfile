FROM mambaorg/micromamba:0.25

COPY conda.yml .
RUN \
    micromamba install -y -n base -f conda.yml && \
    micromamba clean -a -y
