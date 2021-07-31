#!/bin/bash

set -xe

rm -rf example
SPIN_CREATE_SWITCH=false SPIN_PROJECT_NAME=Demo SPIN_SYNTAX=Reason SPIN_PACKAGE_MANAGER=Esy spin new . example -d -vv
