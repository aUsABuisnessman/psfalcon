/Applications/Falcon.app/Contents/Resources/falconctl grouping-tags set "$1" &> /dev/null && /Applications/Falcon.app/Contents/Resources/falconctl grouping-tags get | sed "s/^No grouping tags set//; s/^Grouping tags: //"