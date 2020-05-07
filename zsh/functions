#!/bin/bash

loopback_init(){
  for addr in `seq 2 $@`; do
    sudo ifconfig lo0 alias 127.0.0.$addr up
    echo "Inititialized 127.0.0.$addr"
  done
}
