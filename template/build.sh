#!/usr/bin/env bash
LSLB_VERSION=''
PHP_VERSION=''
PUSH=''
CONFIG=''
TAG=''
BUILDER='litespeedtech'
REPO='loadbalancer'
EPACE='        '

echow(){
    FLAG=${1}
    shift
    echo -e "\033[1m${EPACE}${FLAG}\033[0m${@}"
}

help_message(){
    echo -e "\033[1mOPTIONS\033[0m" 
    echow '-L, --lslb [VERSION]'
    echo "${EPACE}${EPACE}Example: bash build.sh --lslb 3.1.6"
    exit 0
}

check_input(){
    if [ -z "${1}" ]; then
        help_message
    fi
}

build_image(){
    if [ -z "${1}" ]; then
        help_message
    else
        echo "${1}"
        docker build . --tag ${BUILDER}/${REPO}:${1} --build-arg LSLB_VERSION=${1}
    fi    
}

main(){
    build_image ${LSLB_VERSION}
}

check_input ${1}
while [ ! -z "${1}" ]; do
    case ${1} in
        -[hH] | -help | --help)
            help_message
            ;;
        -[lL] | -lslb | --lslb) shift
            check_input "${1}"
            LSLB_VERSION="${1}"
            ;;
        -[tT] | -tag | -TAG | --tag) shift
            TAG="${1}"
            ;;              
        *) 
            help_message
            ;;              
    esac
    shift
done

main
