#!/usr/bin/env bash
#
# Copyright (c) 2018-2019 The Bitcoin Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

export LC_ALL=C.UTF-8

BEGIN_FOLD () {
  echo ""
  CURRENT_FOLD_NAME=$1
  if [ "$TRAVIS" == "true" ]; then
    echo "travis_fold:start:${CURRENT_FOLD_NAME}"
  else
    echo "::group::${CURRENT_FOLD_NAME}"
  fi
}

END_FOLD () {
  RET=$?
  if [ "$TRAVIS" == "true" ]; then
    echo "travis_fold:end:${CURRENT_FOLD_NAME}"
  else
    echo "::endgroup::"
  fi
  if [ $RET != 0 ]; then
    echo "${CURRENT_FOLD_NAME} failed with status code ${RET}"
  fi
}

