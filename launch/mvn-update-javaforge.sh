#!/bin/bash

mvn clean package --activate-profiles update-from-java-forge  --show-version --update-snapshots --define skipTests

