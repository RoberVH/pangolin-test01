#!/bin/bash
Obtener todos los pares registrados en contrato Pangolin_Factory dirección de fuji 0xE4A575550C2b460d2307b82dCd7aFe84AD1484dd
cast call 0xE4A575550C2b460d2307b82dCd7aFe84AD1484dd "allPairs(uint256)(address)" 0 --rpc-url $RPC_TEST

Pares existentes: 
0: 0x8364a01108D9b71Ed432C63Ba7fa57236A908647 Pares: 0xd00ae08403B9bbb9124bB305C09058E32C39A48c & 0xf4E0A9224e8827dE91050b528F34e2F99C82Fbf6
1: 0x295Bfc4A2344642F44f66395AdF0c29939f3faeA
2: 0x2F8E47EEd7d8D67e50049171BbE3B51c9A666887
3: 0x331469c81Ed3e9761961Cc6F70dD1bf70CBCD681
4: 0xd4F5fBB422284739950645e22d681F01950034a7

Obtener nombres de los pares y direcciones en contrato Pangolin_Factory dirección de fuji 0xE4A575550C2b460d2307b82dCd7aFe84AD1484dd
cast call <DIRECCION_DEL_PAR> "token0()(address)" --rpc-url $RPC_TEST
cast call <DIRECCION_DEL_PAR> "token1()(address)" --rpc-url $RPC_TEST

cast call 0x8364a01108D9b71Ed432C63Ba7fa57236A908647 "token0()(address)" --rpc-url $RPC_TEST
cast call 0x8364a01108D9b71Ed432C63Ba7fa57236A908647 "token1()(address)" --rpc-url $RPC_TEST