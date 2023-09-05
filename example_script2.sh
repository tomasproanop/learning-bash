#!/bin/bash
echo Die PID dieses Skriptes ist $$
echo der PP des Skriptes hat die PID $PPID # $(ps -o ppid= $$)
mynormalvar ist nicht sichtbar: $mynormalvar
echo my_env_var dagegen schon: $my_env_var

