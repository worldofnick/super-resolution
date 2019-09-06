FROM tensorflow/tensorflow:1.13.1-gpu-py3

# Install system packages
RUN apt-get update && apt-get install -y --no-install-recommends \
      bzip2 \
      g++ \
      git \
      graphviz \
      libgl1-mesa-glx \
      libhdf5-dev \
      openmpi-bin \
      screen \
      unrar \
      unzip \
      wget && \
    rm -rf /var/lib/apt/lists/* \
    apt-get upgrade



ADD src /src

WORKDIR /src

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

EXPOSE 5000

ENTRYPOINT ["python3"]

CMD ["app.py"]






