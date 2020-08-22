# ~/.bashrc. Executed by bash when launching interactive non-login shells.
# shellcheck disable=1090 disable=2034

tty="$(tty)"

# Source bashrc scripts. Scripts are located in my home directory.
shopt -s globstar  # Source recursively.
shopt -s nullglob  # Set nullglob so the unmatched username glob is not made literal.
for file in /home/akelley/.config/bashrc.d/**.sh /home/austin/.config/bashrc.d/**.sh; do
    source "${file}"
done
