#!/usr/bin/env zsh

echo "Benchmarking..."

for i in $(seq 1 10); do
    /usr/bin/time /bin/zsh -i -c exit
done

if [ -f zsh-bench/zsh-bench ]; then
    zsh-bench/zsh-bench
fi
