#!/bin/bash
# Get the mode from snap environment variable
MODE=$(snapctl get env.nodetype)

# Prepare command options
if [ "$MODE" == "server" ]; then
    # Include write-kubeconfig option for server mode
    EXEC_COMMAND="$SNAP/bin/rke2 $MODE --config $SNAP_COMMON/config.yaml --data-dir $SNAP_COMMON/data --write-kubeconfig $SNAP_COMMON/rke2.yaml"
else
    # Do not include write-kubeconfig for other modes
    EXEC_COMMAND="$SNAP/bin/rke2 $MODE --config $SNAP_COMMON/config.yaml --data-dir $SNAP_COMMON/data"
fi

# Execute the command
exec $EXEC_COMMAND