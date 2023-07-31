#!/bin/bash

function gcd() {
	local arg1=$1
	local arg2=$2

	while [ $(( arg1 * arg2 )) -ne 0 ];
	do
		if [ $arg1 -gt $arg2 ]; then
			arg1=`expr $arg1 - $arg2`
		else
			arg2=`expr $arg2 - $arg1`
		fi
	done
	echo "$arg1"
}

# 引数が2つ以外の場合はエラー
if [ $# -ne 2 ]; then
	echo "error">&2
	exit 1
fi

arg1=$1
arg2=$2

# 引数が整数以外の場合はエラー
if ! [[ "$arg1" =~ ^[0-9]+$ ]] || ! [[ "$arg2" =~ ^[0-9]+$ ]]; then
	echo "error">&2
	exit 1
fi

# 最大公約数を計算して出力
result=`gcd $arg1 $arg2`
echo $result
