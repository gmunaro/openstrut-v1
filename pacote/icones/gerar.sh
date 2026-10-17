#!/bin/sh
# Gera os PNGs (16 a 1024 px) e o .ico a partir do SVG desta pasta. Os
# resultados ficam versionados; rode de novo só se mudar o SVG. Precisa de
# rsvg-convert e ImageMagick; sem eles, rode num container:
#   docker run --rm -v "<esta pasta>:/w" alpine sh -c 'apk add -q rsvg-convert imagemagick && sh /w/gerar.sh'
# O .icns do macOS sai destes PNGs no próprio Mac (macos/empacotar.sh, com iconutil).
set -eu
cd "$(dirname "$0")"
for v in v1; do
    mkdir -p "png/$v"
    for t in 16 24 32 48 64 128 256 512 1024; do
        rsvg-convert -w "$t" -h "$t" "openstrut-$v.svg" -o "png/$v/$t.png"
    done
    magick png/$v/16.png png/$v/24.png png/$v/32.png png/$v/48.png png/$v/64.png \
        png/$v/128.png png/$v/256.png "openstrut-$v.ico"
done
ls -l png/* ./*.ico
