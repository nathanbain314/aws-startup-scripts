#!/bin/bash

# Build supervanitygen
yum -y install git gcc make automake autoconf libtool gmp-devel
git clone https://github.com/klynastor/supervanitygen.git
cd supervanitygen && make

while true; do
  # Run supervanitygen until one of the patterns is found
  /supervanitygen/vanitygen -q 1Pattern 1OtherPattern > output
  # Concatenate the matches to the previous matches and post it full result
  curl -H "Content-Type: application/json" -X PUT -d "{\"title\":\"NewPost\",\"snippet\":\""$(cat output)"\\n"$(echo $(curl https://friendpaste.com/POST_ID/raw)|sed 's/ /\\n/g')"\",\"language\":\"text\"}" https://friendpaste.com/POST_ID
done