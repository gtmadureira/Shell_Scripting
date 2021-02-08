#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
#!/bin/sh
cat stub_config.sh ../target/${artifactId}-${version}-runnable.jar > ${artifactId}-${version}-runnable.jar && java -jar ${artifactId}-${version}-runnable.jar
