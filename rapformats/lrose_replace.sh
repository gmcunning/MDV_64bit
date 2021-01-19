#!/bin/bash

# This script uses sed to replace LROSE inlcude targets with RAL targets in
# make files
#
# replace $(LROSE_CORE_DIR)/build/make_include/lrose
# with $(RAP_MAKE_INC_DIR)/rap
#

fn=$1

cp $fn $fn.old

sed 's|(LROSE_CORE_DIR)/build/make_include/lrose|(RAP_MAKE_INC_DIR)/rap|' < $fn.old > $fn
