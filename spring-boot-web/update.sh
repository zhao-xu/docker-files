#!/bin/bash
#set -x
set -Eeuo pipefail

declare -a versions=(
    8-jre-alpine
    10-jre
    11-jre
)
for version in "${versions[@]}"; do
    IFS='-'
    variants=($version)
    unset IFS
    javaVersion="${variants[0]}"
    javaType="${variants[1]}"
    variant="${variants[2]:=}"
    dir="$javaVersion/$javaType${variant:+-$variant}"
    [ -d $dir ] || mkdir -p $dir
    cp logback-spring.xml "$dir/"
    template=Dockerfile${variant:+-$variant}.template
    sed -r \
        -e 's!%%VERSION%%!'"$javaVersion-$javaType${variant:+-$variant}"'!g' \
        $template \
        > "$dir/Dockerfile"
done
