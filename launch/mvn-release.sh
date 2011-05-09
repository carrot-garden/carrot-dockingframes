#!/bin/bash

rm release.properties pom.xml.releaseBackup

git commit --all --message "ready"

mvn clean package --activate-profiles update-from-java-forge  --show-version --update-snapshots --define skipTests

mvn release:prepare --batch-mode  --show-version --update-snapshots --define skipTests

mvn release:perform --batch-mode  --show-version --update-snapshots --define skipTests


######################

rm release.properties pom.xml.releaseBackup

git commit --all --message "ready"

mvn release:prepare --batch-mode  --show-version --update-snapshots --define skipTests

mvn release:perform --batch-mode  --show-version --update-snapshots --define skipTests

######################

mvn release:rollback --batch-mode  --show-version --update-snapshots --define skipTests

git tag -d docking-frames-base-1.1.0
git push origin :refs/tags/docking-frames-base-1.1.0

git branch -d 1.1.0-SNAPSHOT
git push origin :1.1.0-SNAPSHOT

