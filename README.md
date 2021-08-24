# penv_docker

Python3.7.9( + jupyterlab)環境をDockerで構築する


## Use

```docker
docker-compose build
docker-compose up -d
docker-compose exec py379 bash
```

### Docker-bash

```bash
jupyter lab password
jupyter lab
```

Try access : `localhost:10027`

`jupyter lab password` で設定したパスワードで入ることができる

## tensorflow 1.x (& Keras)を使用したい場合

構築してから以下のライブラリをインストールする

```
tensorflow==1.15.0
Keras==2.0.2
h5py==3.2.1
```