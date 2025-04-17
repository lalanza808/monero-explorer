#!/bin/bash

sed -i 's_~/monero_~/wownero_' CMakeLists.txt
sed -i 's_"external/miniupnp/miniupnpc"_"external/miniupnp/miniupnpc" "/external/randomwow"_' cmake/FindMonero.cmake
sed -i 's_external/randomx_external/randomwow_' cmake/FindMonero.cmake
sed -i 's_Total xmr_Total WOW_' src/templates/checkrawoutputkeys.html
sed -i 's_monero version_wownero version_' src/templates/footer.html
sed -i 's_monero version_wownero version_' src/templates/header.html
sed -i 's_https://github.com/moneroexamples/onion-monero-blockchain-explorer_https://github.com/lalanza808/wownero-explorer_' src/templates/footer.html

sed -i 's_color: white_color: #f9f9f9_' src/templates/css/style.css
sed -i 's_background-color: black_background-color: #231f20_' src/templates/css/style.css
sed -i 's_body {_body {\n\tfont-family: monospace;\n\tfont-size: 14px;_' src/templates/css/style.css

grep -rl 18081 src | xargs sed -i 's_18081_34568_'
grep -rl 12f src | xargs sed -i 's_12f_11f_'
grep -rl e12 src | xargs sed -i 's_e12_e11_'
grep -rl "Onion Monero Blockchain Explorer" src | xargs sed -i 's_Onion Monero Blockchain Explorer_Wownero Explorer_'
grep -rl Monero src/templates | xargs sed -i 's_Monero_Wownero_'
# grep -rl monero src/templates | xargs sed -i 's_monero_wownero_'
grep -rl XMR src/templates | xargs sed -i 's_XMR_WOW_'
grep -rl " xmr" src/templates | xargs sed -i 's_" xmr"_" WOW"_'


cat << EOF >> src/templates/header.html
<img style="position: fixed; width: 200px; bottom: 0; right: 0; z-index: -1;" src="$(cat catgirl.txt)">
EOF
