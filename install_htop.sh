#/bin/bash

#mynum=300

#if [ $mynum -gt 200 ]
#then
#    echo "The condition is true."
#else
#    echo "The variable does not equal 200."
#fi

#if [ -f ~/myfile ]
#then
#    echo "the file exists." 
#else
#    echo "the files does not exist."
#fi

#command=/usr/bin/htop

#if [ -f $command ]
#then
#    echo "$command is available, let's run it..."
#else
#    echo "$command is not available, installing..."
#    sudo apt-get install htop
#fi

#$command 

command=htop

if command -v $command
then
    echo "$command is available, let's run it..."
else
    echo "$command is not available, installing..."
    sudo apt-get install $command
fi

$command
