#!/usr/bin/env zsh

echo "Benchmarking..."

for i in $(seq 1 10); do
    /usr/bin/time /bin/zsh -i -c exit
done

$DOTFILES/lib/zsh-bench/zsh-bench
