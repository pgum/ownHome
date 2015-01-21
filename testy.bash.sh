#!/ffp/bin/bash

_pass()
{ 
	echo " PASS" 
}

_fail()
{
	echo " FAIL" 
}
_assert_print()
{
echo "Assert $1!"
echo "Expected: $2"
echo "Actual: $3"
}
_assert()
{
#echo "ASSERT($1,$2,$3)"
if [ ! "$2" $1 "$3" ] 
then
	_assert_print $1 $2 $3
	_fail
	exit
fi
}

_testname()
{
echo -n ${1#test_}...
}


test_testnameIsFunctionNameWithoutPrefix(){ 
_testname $FUNCNAME
local function_prefix_to_cut="test_"
local expected="${FUNCNAME#$function_prefix_to_cut}"
local actual=$(_testname $FUNCNAME)
_assert "==" $expected $actual
_pass
}

test_testnameIsFunctionNameWithoutPrefix

#run all tests
	#read from $0 content of this file
	#filter only lines with "test_" in the beginning and "()" or "(){" at the end
	#remove brackets and leave only name
	#run each command 
	#after each command run _pass (as assertions fail & exit test
echo ----

