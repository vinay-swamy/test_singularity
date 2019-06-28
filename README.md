# TransAbyss Singularity Container
I needed to use the Trans-ABySS transcriptome assembler(https://github.com/bcgsc/transabyss) but it wasn't installed on biowulf
- The def file builds the singularity image
- the setup.sh file pulls transabyss and makes a few adjustments needed to work with the container
- the assemble.sh file is a slightly modified version of the author's wrappers script
- to run : singualrity exec python ./assemble.sh \<inputs\> \<outputs\>
