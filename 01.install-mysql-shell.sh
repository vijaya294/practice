#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is...$R FAILED $N"
        exit 1
    else
        echo -e "$2 is... $G SUCCESS $N"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "please run this script with root access"
    exit 1
fi

dnf list installed git

if [ $? -ne 0 ]
then
    echo -e "$R Git is not installed, going to install it.. $N"
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo -e "$G Git is already installed, nothing to do.. $N"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo -e "$R MySQL is not installed...going to install $N"
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo -e "$G MySQL is already installed..nothing to do $N"
fi
