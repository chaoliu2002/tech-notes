#track="origin/master"
#track="lastbuild/master"
track=$1
removestr="origin/"
space=""

shortname=${track//$removestr/$space}

echo $shortname
