# tutorial-swat4hcl23
SWAT4HCLS Tutorial: Creating Knowledge Graphs Subsets

Contents:

- shex: Contains some ShEx schemas
- dumps: Contains two snippets of Wikidata dumps, one with 100 lines and another with 3000 lines
- notebooks: Example notebook of how to run sheXer
- examples: Some examples used in the slides
- wdsub-0.0.33: Binaries of wdsub version 0.0.33

# Example running a subset

## Windows

```sh
.\wdsub-0.0.33\bin\wdsub dump -s .\shex\GeneWiki.shex --schemaFormat ShExC -o target/GeneWikiSubset.ttl.gz --dumpMode OnlyMatched --dumpFormat Turtle .\dumps\3000lines.json.gz
```

## Linux

```sh
wdsub-0.0.33/bin/wdsub dump -s shex/GeneWiki.shex \
   --schemaFormat ShExC \
   --output target/GeneWikiSubset.ttl.gz \
   --dumpMode OnlyMatched \ 
   --dumpFormat Turtle \
    dumps/3000lines.json.gz
```
# Author

[Jose Emilio Labra Gayo](http://labra.weso.es)