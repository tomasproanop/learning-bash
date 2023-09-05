#!/bin/bash 
echo Die PID dieses Skriptes ist $$
echo Der Parent-Prozess des Skriptes hat die PID $PPID # $(ps -o ppid= $$)
echo my_normal_var ist nicht sichtbar: $my_normal_var
echo my_env_var dagegen schon: $my_env_var

