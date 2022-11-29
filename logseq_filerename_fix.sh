#!/bin/bash
# Figure out how to manually resolve one file first.

echo "Please read README.md, and ALWAYS WORK ON A COPY!"
echo "You got 5 seconds to ctrl-c out of here"
sleep 5
echo "Cool, let's do this"
echo
find -name '*.md' -print0 |
while IFS= read -r -d '' I; do
  DIR=$(dirname "$I")
  FN=$(basename "$I")
  FNDOT="${FN//[^.]}"
  DOTCOUNT=$(echo $FNDOT | wc -c)
  if [[ "$FN" == *"%2F"* || $DOTCOUNT -gt 2 ]]; then
    RN=$(echo $FN | sed 's/%2F/___/g' | sed 's/\./___/g' | sed 's/___md$/.md/' )
    if [[ -f "$DIR/$FN" && -f "$DIR/$RN" ]]; then
      diff -q "$DIR/$FN" "$DIR/$RN" > /dev/null
      if [[ $? -eq 0 ]]; then
        rm "$DIR/$FN"
      else
        echo "Files $DIR/$FN $DIR/$RN"
        diff "$DIR/$FN" "$DIR/$RN"
        echo
      fi
    fi
  fi
done

if [ -d logseq ]; then
  echo "Cleaning out logseq dir"
  rm -r logseq/bak
  rm -r logseq/.recycle
  rm logseq/graphs-txid.edn
  rm logseq/metadata.edn
  rm logseq/srs-of-matrix.edn
fi




# 1. Go through all files
# 2. Do file rename on file
# 3. Check if file exists
# 4. If it does do diff
# 5. Same? Remove old file
# 6. Not same, inform user with diff



