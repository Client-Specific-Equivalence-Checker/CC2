# CC2
CLEVER V2

## Repo Development Guide
- Create a branch for your development and pull request to merge with master. Merge your pull request once one other developer has approved it.

## Repo Style Guide
- Examples live in the ```instances``` folder and are divided into equal (```eq```) and not equal (```neq```) sub-folders.
- Example are themselves folders living inside of ```eq``` and ```neq```.
- Name examples with lower case letters and underscores for spacing. Version numbers at the end do not need to be separated by an underscore.
- Each example should contain four files: ```old.c```, ```new.c```, ```merged.c```, and ```README.md```. These files contain two versions of the test instance, one in ```old.c``` and one in ```new.c```; a manually merged product program of the two versions, in ```merged.c```; and a description of the instance, in ```README.md```. 

## Maintenance TODO
- [ ] Manually merge 10 programs each

## Interesting TODO
- How to handle recursion?

## Manual Merge Guide
- Document any decisions you make here!
- Name the return of the old and new versions as ```ret1``` and ```ret2``` respectively.
- Inline into a single function called ```main```
    - Or use global variables for returns? Will this restrict us to functional equivalence?
- When duplicating variables add the suffix ```1``` and ```2``` for old and new version respectively
- Insert assertions as comments