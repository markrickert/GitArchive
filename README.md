# GitArchive

Archival script for pulling down a complete git repository, branches and all.

Here is the stuff this script does:

1. Clones the repository
2. Fetches all remote branches
3. Compresses the folder
4. Deletes the cloned folder.

Your remote repository is left untouched by this script.

## Installation
Simple: Download the script and run it wil the `sh` command.

More advanced:

1. Download the script and rename it to `gitarchive`.
2. Make it executable by running `chmod +x gitarchive`.
3. Put it somewhere in your `PATH` so you can access the script from anywhere.

## Usage
Run `sh gitarchive.sh [your repository clone url]` or simply `gitarchive [your repository clone url]` if you made the script executable and put it in your path.

## Output
This script will output a gzipped tarball of all branches of the supplied URL.

## License
See the `LICENSE` file.
