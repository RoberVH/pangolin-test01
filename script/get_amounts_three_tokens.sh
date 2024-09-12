#!/bin/bash

# Asegúrate de que FORK_URL está definido en tu entorno
export FORK_URL=https://api.avax.network/ext/bc/C/rpc
if [ -z "$FORK_URL" ]; then
    echo "Error: FORK_URL no está definido"
    exit 1
fi

# Función para convertir wei a ether
wei_to_ether() {
    echo "scale=18; $1 / 1000000000000000000" | bc
}

# Hacer la llamada y capturar la salida
output=$(cast call 0xE54Ca86531e17Ef3616d22Ca28b0D458b6C89106 "getAmountsOut(uint256,address[])(uint256[])" 1000000000 "[0x152b9d0FdC40C096757F570A51E494bd4b943E50,0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E,0xd586E7F844cEa2F87f50152665BCbc2C279D8d70]" --rpc-url $FORK_URL)

# Extraer los valores del output
input_amount=$(echo $output | cut -d' ' -f1)
usdc_amount=$(echo $output | cut -d' ' -f2)
dai_amount=$(echo $output | cut -d' ' -f3)

# Convertir y mostrar los resultados
echo "Entrada: $(wei_to_ether $input_amount) BTC.b"
echo "USDC intermedio: $(echo "scale=6; $usdc_amount / 1000000" | bc) USDC"
echo "Salida final: $(wei_to_ether $dai_amount) DAI.e"
