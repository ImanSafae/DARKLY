#!/bin/bash

handleReadMe() {
    local url=$1
    local readMeContent=$(wget -q -O - $url 2>/dev/null)
    # echo "readme content: $readMeContent"
    if echo "$readMeContent" | grep -iq "flag"; then
        echo "Flag trouvé dans $url :"
        echo "$readMeContent"
    fi
}

getPageContent() {
    local url=$1
    local pageContent=$(wget -q -O - $url 2>/dev/null)
    local linksList=$(echo "$pageContent" | grep -oP 'href="\K[^"]+' | grep -v '^../')
    # echo "page content: $linksList"
    for link in $linksList; do
        if [[ $link == *"README"* ]]; then
            handleReadMe "$url$link"
        else
            getPageContent "$url$link"
        fi
    done

}

baseUrl="http://192.168.1.16/.hidden/"

# firstPage=$(wget -q -O - $baseUrl 2>/dev/null)

echo "----------------------------"

# pagesList=$(echo "$firstPage" | grep -oP 'href="\K[^"]+' | grep -v '^../')

# echo "$pagesList"

getPageContent "$baseUrl"
