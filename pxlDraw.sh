# hide cursor \033[?25l
# show cursor \003[?25h
# clear \033[2J
# move cursor \033[1;1H
# front color printf "\x1B[38;2;R;G;Bm"
# back color printf "\x1B[48;2;R;G;Bm"
# move cursor \x1B[Y;XH
# clear \x1B[2J
# color codes 30Black 31Red 32Green 33Yellow 34Blue 35Magenta 36Cyan 37White 40Black 41Red 42Green 43Yellow 44Blue 45Magenta 46Cyan 47White
#
printPXL() {
    printf '\e['$2'm' #text color
    printf '\e['$3'm' #highlight color
    printf $1
    printf '\e[0m'
}

printf '\033[?25l'
printf '\033[?25h'
printf '\033[10,10H'



input=0

echo Enter code
read input
echo ""

if [ "$input" = "q" ]; then
    input="00111000 01000100 00000100 00001000 00010000 00000000 00010000"
    echo "Try circ, sq, tri, tree, space, hapi, !"
    echo ""
fi

if [ "$input" = "circ" ]; then
    input="00111100 01000010 10000001 10000001 01000010 00111100"
fi

if [ "$input" = "sq" ]; then
    input="11111111 10000001 10000001 10000001 11111111"
fi

if [ "$input" = "tri" ]; then
    input="00011000 00111100 01111110 11111111"
fi

if [ "$input" = "tree" ]; then
    input="00011000 00111100 01111110 11111111 00011000 00011000 00011000"
fi

if [ "$input" = "space" ]; then
    input="00100100 01111110 11111111 11011011 01111110 01000010 10111101 10000001"
fi

if [ "$input" = "hapi" ]; then
    input="00111100 01000010 10101001 10101001 10000101 10111001 01000010 00111100"
fi

if [ "$input" = "!" ]; then
    input="00010000 00010000 00010000 00000000 00010000"
fi

map=($(echo $input|sed  's/\(.\)/\1 /g'))

ticker=0
for i in "${map[@]}"; do
    if [ "$i" -eq "0" ]; then
        printPXL '0' '30' '30'
    else   
        printPXL '1' '47' '47'
    fi
    ticker=$(($ticker+1))
    if [ $(($ticker % 8)) -eq 0 ]; then
        echo ""
    fi
done
