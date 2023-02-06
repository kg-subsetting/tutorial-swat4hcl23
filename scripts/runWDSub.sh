#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 -v <versionNumber> -d <dumpFile> -s <ShExFile>"
   echo -e "\t-v version number, something like '0.0.32'"
   echo -e "\t-d dumpFile name (without .json.gz), something like 'wikidata-20150601-all'"
   echo -e "\t-s ShExFile name (without .shex), something like 'GeneWiki'"
   exit 1 # Exit script after printing help
}

while getopts "v:d:s:" option ;
do
   case "${option}" in
      v ) 
       version="${OPTARG}" ;;
      d ) 
      dumpFile="${OPTARG}" ;;
      s ) 
      shExFile="${OPTARG}" ;;
      ? ) 
      helpFunction ;; 
   esac
done

if [ -z "${version}" ]
then
   echo "Version is empty, assumed 0.0.32";
   version="0.0.32"
   helpFunction
fi

if [ -z "$dumpFile" ] 
then
   echo "dumpFile is empty";
   helpFunction
fi

if [ -z "$shExFile" ] 
then
   echo "ShExFile is empty";
   helpFunction
fi

SchemaFormat=ShExC
DumpMode=OnlyMatched
DumpFormat=Turtle
LocalDir=/home/labra

docker run -d -v ${LocalDir}/dumps:/data \
              -v ${LocalDir}/shex:/shex \
              -v ${LocalDir}/target:/target \
              wesogroup/wdsub:${version} dump \
              -o /target/${ShExFile}_${dumpFile}.ttl.gz \
              -s /shex/${ShExName}.shex \
              /dumps/${dumpFile}.json.gz \
              --dumpFormat ${DumpFormat} \
              --dumpMode ${DumpMode} \
              --schemaFormat ${SchemaFormat}