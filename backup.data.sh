#!/bin/bash

echo "Will backup the data folder"

tar -cvzf "backup_data_$(date +%F-%H-%M-%S).tar.gz" data