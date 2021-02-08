#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
#!/bin/bash
clear
cd ../target/classes/
jar cfm ../../pkged-app/dist/${artifactId}-${version}-fixed.jar ../../pkged-app/MANIFEST.MF .
cd -
java -jar dist/${artifactId}-${version}-fixed.jar
