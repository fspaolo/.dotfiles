# Print colors supported by terminal
for i in {0..255} ; do
  printf "\x1b[38;5;${i}mcolour${i} "
done
