#! /bin/bash

ERROR_EXIT () {
	echo "$1">&2
	rm -f /tmp/$$-*
	exit 1
}

function run_test() {
	local arg1=$1
	local arg2=$2
	local arg3=$3
	
	./gcd.sh $arg1 $arg2>/tmp/$$-result
	echo $arg3>/tmp/$$-ans
	diff /tmp/$$-ans /tmp/$$-result && echo ok || ERROR_EXIT test_error

	rm -f /tmp/$$-*
}

# 引数2の前提でのテストケース。
# テストケースを実行
run_test 10 5 5
run_test 14 28 14
run_test 21 14 7
run_test 17 13 1
run_test 30 20 10
run_test 49 7 7
run_test 1024 128 128
run_test 12345 6789 3
run_test 37 37 37
run_test 1 1 1

# エラーテストケース
run_test 5.5 3 error
run_test abc 10 error
run_test 10 abc error
run_test 10 -5 error
run_test -10 5 error
run_test 10 0 error
run_test 0 0 error
run_test 3.14 2 error

# 引数2以外のテスト
./gcd.sh 10>/tmp/$$-result
echo error>/tmp/$$-ans
diff /tmp/$$-ans /tmp/$$-result $$ echo ok || ERROR_EXIT test_error
rm -f /tmp/$$-*

./gcd.sh>/tmp/$$-result
echo error>/tmp/$$-ans
diff /tmp/$$-ans /tmp/$$-result && echo ok || ERROR_EXIT test_error
rm -f /tmp/$$-*
