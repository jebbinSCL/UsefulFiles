#!/bin/bash -eu

TARGET=${1:-""}
DEBUGMODE=${2:-"notDebug"}

if [ "$TARGET" = "all" ]; then
    if [ "$DEBUGMODE" = "debug" ]; then 
        echo "To debug all run ./runApp.sh $servicefolder debug"
        echo "Or open services in IDE directly"
        # devenv //run auth/Auth.sln &
        # devenv //run sessions/Sessions.sln &
        # devenv //run comms/Comms.sln &
        # sleep 10
        # start bash -c "cd frontend; ./localBuildRun.sh"
        # devenv //run gateway/Gateway.sln &
    else 
        start bash -c "cd auth; ./localBuildRun.sh"
        start bash -c "cd sessions; ./localBuildRun.sh"
        start bash -c "cd publish; ./localBuildRun.sh"
        echo "Note : Comms has been removed from start all"
        sleep 5
        start bash -c "cd frontend; ./localBuildRun.sh"
        start bash -c "cd gateway; ./localBuildRun.sh"
    fi
else 
    if [ -d "$TARGET" ]; then
        if [ "$DEBUGMODE" = "debug" ]; then
            if [ "$TARGET" = "frontend" ]; then
                start bash -c "cd frontend; ./localBuildRun.sh"
            else 
                devenv //run $TARGET/$TARGET.sln &
                #start bash -c "devenv //run $TARGET/$TARGET.sln"
            fi
        else 
            start bash -c "cd $TARGET; ./localBuildRun.sh"
        fi
    else
        echo "Directory: $TARGET does not exist"
    fi
fi
