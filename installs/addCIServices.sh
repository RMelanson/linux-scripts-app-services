#! /bin/bash
# SETUP THE REQUIRED ENVIRONMENTT
echo $setupName: EXECUTING ./env/setEnv.sh
. ./env/setEnv.sh

#INSTALL $daemon AS AN init.d SERVICE
scriptName=addAppServices.sh

echo $scriptName Set $daemon as an init.d service

# INSTALL JAVA APPS DAEMON TO SERVER
echo addAppServices.sh EXECUTING: cp ./installs/$daemon.d $ciBin/$daemon
echo y | cp ./installs/$daemon.d $ciBin/$daemon

# CREATE SYMBOLIC LINK FOR APPS SERVICES
echo addAppServices.sh EXECUTING: ln -s  $ciBin/$daemon /sbin/apps
ln -s  $ciBin/$daemon /sbin/apps

echo addAppServices.sh EXECUTING: chmod 766 $ciBin/$daemon
chmod 766 $ciBin/$daemon

# CREATE PROCESS DIRECTORY
echo addAppServices.sh EXECUTING: cp -rf $installDir/servicesDir $servicesDir
cp -rf $installDir/services/* $servicesDir

# CREATE PROCESS IDs DIRECTORY
echo addAppServices.sh EXECUTING: mkdir $programIds
mkdir $programIds

# ADD apps TEST SERVICES SCRIPTS DIRECTORY
echo addAppServices.sh EXECUTING: mkdir $testServicesScriptsDir
mkdir -p $testServicesScriptsDir

echo addAppServices.sh EXECUTING: chmod -R 744 $servicesDir
chmod -R 755 $servicesDir