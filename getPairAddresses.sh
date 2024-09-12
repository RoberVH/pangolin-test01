#!/bin/bash
echo $RPC_TEST
echo 'Token 0'
echo $1
cast call $1 "token0()(address)" --rpc-url $RPC_TEST
echo 'Token 1'
cast call $1 "token1()(address)" --rpc-url $RPC_TEST



