#!/bin/bash

cd dlls

for i in *.dll; do
    mono ../mono-cil-strip.exe "$i";
done
