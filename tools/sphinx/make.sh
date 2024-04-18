sphinx-build: the following arguments are required: sourcedir, outputdir, filenames

# change to project directory. -- return to current dir after execution of this script.
while true ; do
	echo "dir $PWD"
	if [[ $PWD == "/" ]]; then
		echo "we could not find the project directory. it should contain tools in the root"
		exit 
	fi
    if [[ "$(basename $PWD)" =~ "tools" ]]; then
      cd ..
      break
    fi
    cd ..
done

# copy README.rst form root to doc
cp README.rst doc

if [ -z "$1" ]
then
  echo "\nargument missing. we will use html. you can run again with help as param" 
  sphinx-build -M html doc docs
else
  sphinx-build -M $1 doc docs
#   $SPHINXOPTS $O
fi

touch docs/.nojekyll
touch docs/html/.nojekyll
