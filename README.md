# logseq_filerename_fix

So I messed up the file rename resulting in a lot of duplicate files matching
the pre and post rename action.

If you got "Duplicate file Page%2FExample.md Page___Example.md" then this might
be your ticket out of here.

**This script does a batch process on your notes, always work on a copy to avoid
data loss!**

## What is does
It checks for files that are pre-rename, with multiple . or %2F in it, and does
a simple regex to rename it to the new. If it find both files it will then do a
diff, when equal it will remove the old file.

If the files are not equal it will print both filenames and a full diff so you
can manually remove/sync changes

## Steps
### Close logseq
You do NOT want logseq to mess with your files while running this, stop it
first.

### Make a copy
This script removes files, and while it does a lot of checks, yeah, backups. So
make a copy and work on that.

### Run this script in the root of the folder
It will find all .md files that need a rename so running it in your graph folder
will make it crawl through the subdirectories

### Post run, start fresh
Once done with the script, you will need to cleanout the logseq directory.
Remove anything you don't need except for the config.edn file. Then start
logseq, and load the directory in a new graph

### Sync new graph to new cloud instance
If you now hook it up to your current cloud, all the missing files will be
recreated and you're back at square one. So sync to a new cloud instance, just
add a 2 or something.




