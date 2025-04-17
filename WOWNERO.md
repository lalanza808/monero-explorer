# wownero-explorer

To get this explorer working for latest Wownero release, follow these steps:

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