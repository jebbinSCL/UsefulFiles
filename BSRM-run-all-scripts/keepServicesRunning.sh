#!/bin/bash -euv
start bash -c "./keepRunning.sh sessions localBuildRun.sh"
start bash -c "./keepRunning.sh comms localBuildRun.sh"
start bash -c "./keepRunning.sh auth localBuildRun.sh"
start bash -c "./keepRunning.sh gateway localBuildRun.sh"
start bash -c "./keepRunning.sh frontend localBuildRun.sh"
