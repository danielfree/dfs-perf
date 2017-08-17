#!/usr/bin/env bash
function printUsage {
  echo "Usage: dfs-perf-clean-run-collect <TestCase>"
  echo "now TestCase is one of:"
  echo -e "  SimpleWrite SimpleRead SkipRead Metadata"
  echo -e "  Iterate Massive"
  echo "the detailed configurations are in conf/testsuite/"
}

# if less than 1 args specified, show usage
if [ $# -le 0 ]; then
  printUsage
  exit 1
fi

bin=`cd "$( dirname "$0" )"; pwd`
${bin}/dfs-perf-clean
sleep
wait
${bin}/dfs-perf $1
wait
${bin}/dfs-perf-collect $1
wait
cat ${bin}/../result/DfsPerfReport-$1
