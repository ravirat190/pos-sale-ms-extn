#!/bin/sh

###############################################################################################################
# #############################################################################################################
# #                                                                                                          ##		
# # Author  : Debashis D                                                                                     ##
# # Company : TCS                                                                                            ##
# # File    : build.sh : Script to build platform                                                            ##
# # Date    : 07/22/2021                                                                                     ##
# # Version : 1.0.0                                                                                          ##
# #                                                                                                          ##						
# #############################################################################################################
###############################################################################################################
                                                                                 
MAVEN_COMMAND_INSTALL="mvn clean install -Pcos-cr-platform --legacy-local-repository"
MAVEN_COMMAND_SONAR="mvn clean install sonar:sonar -Pcos-cr-platform --legacy-local-repository -Dsonar.login=myAuthenticationToken"
MAVEN_COMMAND_JUNITS="mvn clean install -Pcos-cr-platform,generate-jacoco-report -Dmaven.test.skip=false -Dmaven.test.failure.ignore=false --legacy-local-repository"

while true; do
    read -p "Please Enter your choice(1 - clean and install , 2 - clean, install and sonar scan, 3 - clean and test, q - quit ) ?" CHOICE
    case $CHOICE in
        [1]* ) exec ${MAVEN_COMMAND_INSTALL}; break;;
        [2]* ) exec ${MAVEN_COMMAND_SONAR}; break;;
        [3]* ) exec ${MAVEN_COMMAND_JUNITS}; break;;
        [qQ]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done


