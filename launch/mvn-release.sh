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

git tag -d carrot-archon-1.0.20
git push origin :refs/tags/carrot-archon-1.0.20

git branch -d 1.0.20-SNAPSHOT
git push origin :1.0.20-SNAPSHOT

