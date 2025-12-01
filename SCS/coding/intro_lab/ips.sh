#!/usr/bin/env bash
for name in $(cat domains.txt); do
  host $name
done
