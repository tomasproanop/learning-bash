#!/bin/bash

declare -a mine
w=${1}
h=${2}
n=${3}

function getfield() {
  if [ "${1}" -lt 0 \
       -o "${1}" -ge "${w}" \
       -o "${2}" -lt 0 \
       -o "${2}" -ge "${h}" \
     ]; then
    echo "-"
  else
    echo "${mine[$((${2}*${w}+${1}))]}"
  fi
}

function minecount() {
  local x y e=""
  local IFS=$'\n'
  for ((x=${1}-1; ${x}<=${1}+1; x++)) do
    for ((y=${2}-1; ${y}<=${2}+1; y++)) do
      e+=$(getfield ${x} ${y})$'\n'
    done
  done
  grep -c "*" <<< ${e}
}

function fieldcount() {
  local IFS=$'\n'
  grep -c "${1}" <<< ${mine[*]}
}

function showmatrix () {
  local x y e
  for ((y=0; ${y}<${h}; y++)) do
    for ((x=0; ${x}<${w}; x++)) do
      e="${mine[$((${y}*${w}+${x}))]}"
      echo -n "${e/${1}/${2}}"
    done
    echo
  done
}

for ((i=0;
      ${i}<${w}*${h};
      i++)) do
  mine[${i}]="?"
done

for i in $(shuf -i 0-$((${w}*${h}-1)) -n ${n}); do
  mine[$i]="*"
done

while true; do
  clear
  if [ $(fieldcount '?') == 0 ]; then
    echo "Geschafft!"
    showmatrix
    break
  else
    echo "Noch $(fieldcount '?') Feld(er)"
  fi
  showmatrix "\*" "?"
  echo -n "x y? "
  read x y

  if [ "${x}" -ge 0 -a "${y}" -ge 0 \
       -a "${y}" -lt "${h}" \
       -a "${y}" -lt "${h}" \
     ]; then
    case "${mine[$((${y}*${w}+${x}))]}" in
      '?')
        mine[$((${y}*${w}+${x}))]=$(minecount ${x} ${y})
        ;;
      '*')
        clear
        echo "Boom!"
        mine[((${y}*${w}+${x}))]="X"
        showmatrix
        break
    esac
  fi
done
