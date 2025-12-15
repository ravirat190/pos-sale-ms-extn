#!/bin/sh

###############################################################################################################
# #############################################################################################################
# #                                                                                                          ##		
# # Author  : Debashis D                                                                                     ##
# # Company : TCS                                                                                            ##
# # File    : change_pom_versions.sh : Change POM Versions before release                                    ##
# # Date    : 07/22/2021                                                                                     ##
# # Version : 1.0.0                                                                                          ##
# #                                                                                                          ##						
# #############################################################################################################
###############################################################################################################
                                                                                 

echo
echo -e Please enter Last Release Version Number. For ex : 1.0.0-RELEASE
echo
read -p 'Enter Last Release Version Number : ' LAST_RELEASE_VERSION


echo
echo -e Please enter Current Release Version Number. For ex : 1.0.1-RELEASE
echo
read -p 'Enter Current Release Version Number : ' CURRENT_RELEASE_VERSION



echo -e Please confirm y - yes q - quit
echo
read -p 'Do you Want to proceed with above keys (y/q) : ' CHOICE

FROM_RELEASE="<version>${LAST_RELEASE_VERSION}</version>"
TO_RELEASE="<version>${CURRENT_RELEASE_VERSION}</version>"
COS_PLATFORM_DEPENDENCY_FROM_RELEASE="<cr.os.library.version>${LAST_RELEASE_VERSION}</cr.os.library.version>"
COS_PLATFORM_DEPENDENCY_TO_RELEASE="<cr.os.library.version>${CURRENT_RELEASE_VERSION}</cr.os.library.version>"

if [ "$CHOICE" == "y" ]
then

	find . -name *pom*.xml > err

	for i in `cat err`
	do
		cat $i | sed -e "s|${FROM_RELEASE}|${TO_RELEASE}|g" | sed -e "s|${COS_PLATFORM_DEPENDENCY_FROM_RELEASE}|${COS_PLATFORM_DEPENDENCY_TO_RELEASE}|g" > $i.temp
		mv $i.temp $i
	done

	rm -rf err
fi

echo
echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
echo
echo  POM and Parent Versions changed from  ${LAST_RELEASE_VERSION} to ${CURRENT_RELEASE_VERSION}
echo
echo \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#
echo
 