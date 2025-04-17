# wownero-explorer

To get this explorer working for latest Wownero release, follow these steps:

## Container image

Image is on Docker Hub, `lalanza808/wownero-explorer:v0.11.3.0`

Modify the below command for your liking

```bash
docker run --rm -it -p 8081:8081 -v ~/.wownero:/home/wownero/.wownero lalanza808/wownero-explorer:v0.11.3.0
```

Note to self:

```bash
docker buildx build \
    --platform linux/amd64 \
    -t lalanza808/wownero-explorer:latest \
    -t lalanza808/wownero-explorer:v0.11.3.0 \
    -f Dockerfile-wownero . \
    --push
```

## Compilation

### Compile Wownero

```bash
git clone https://codeberg.org/wownero/wownero --recursive ~/wownero || echo cloned
cd ~/wownero
git fetch -a
git checkout v0.11.3.0
CC=gcc-13 CXX="g++-13" USE_SINGLE_BUILDDIR=1 make -j32
```

### Compile explorer

```bash
git clone https://github.com/lalanza808/monero-explorer --recursive ~/explorer || echo cloned
cd ~/explorer
bash wowify.sh
mkdir build
cd build
cmake ..
make -j32
```

`wowify.sh` here will replace all of the references needed to get things working.

The compiled binary will be at `xmrblocks` in the `build` dir.

```bash
./xmrblocks
# running port 8081
```
