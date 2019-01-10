#!/bin/bash

IFS=$(echo -en "\n\b")

mkdir -p "pdfy"
cd pdfy

for f in $(find ../ | grep -v ./szablon | grep "/.*/" | grep "\.ly$"); do
    lilypond.sh -dno-point-and-click $f
done