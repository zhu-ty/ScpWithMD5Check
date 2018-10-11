#ls *.bin | xargs -L 1 -P 2 -I {} stdbuf -i0 -e0 -o0 ./Decoder {}
ls *.bin | xargs -L 1 -P 3 -I {}  ./Decoder {}
