# rcs-fast-export

RCS fast export to git


# To install

```sh
make all
sudo make install
```


# Example

```sh
$ cd /tree-under-RCS-control
$ /usr/local/bin/rcs-fast-export . | git fast-import && git reset
```


# usage

```
/usr/local/bin/rcs-fast-export [options] file [file ...]

Fast-export the RCS history of one or more files. If a directory is specified,
all RCS-tracked files in the directory and its descendants are exported.

When importing single files, their pathname is discarded during import. When
importing directories, only the specified directory component is discarded.

When importing a single file, RCS commits are converted one by one. Otherwise,
some heuristics is used to determine how to coalesce commits touching different
files.

Currently, commits are coalesced if they share the exact same log and if their
date differs by no more than the user-specified fuzziness. Additionally, the
symbols in one of the commit must be a subset of the symbols in the other
commit, unless --no-symbol-check is specified or rcs.symbolCheck is set to
false in the git configuration.

Typical usage:
    git init && rcs-fast-export.rb . | git fast-import && git reset

Options:
	--help, -h, -?		display this help text
	--authors-file, -A	specify a file containing username = Full Name <email> mappings
	--[no-]author-is-committer
				use the author name and date as committer identity
	--ignore		ignore the specified files (shell pattern)
	--log-encoding          specify the encoding of log messages, for transcoding to UTF-8
	--rcs-commit-fuzz	fuzziness in RCS commits to be considered a single one when
				importing multiple files
				(in seconds, defaults to 300, i.e. 5 minutes)
	--[no-]warn-missing-authors
				[do not] warn about usernames missing from the map file
	--[no-]symbol-check	[do not] check symbols when coalescing commits
	--[no-]tag-each-rev	[do not] create a lightweight tag for each RCS revision when
				importing a single file
	--[no-]log-filename	[do not] prepend the filename to the commit log when importing
				a single file
	--skip-branches		when exporting multiple files with a branched history, export
				the main branch only instead of aborting due to the lack of
				support for branched multi-file history export



Config options:
	rcs.authorsFile		for --authors-file
	rcs.authorIsCommitter	for --author-is-committer
	rcs.tagEachRev		for --tag-each-rev
	rcs.logFilename		for --log-filename
	rcs.commitFuzz		for --rcs-commit-fuzz
	rcs.warnMissingAuthors  for --warn-missing-authors
	rcs.symbolCheck		for --rcs-symbol-check
	rcs.tagFuzz		for --rcs-tag-fuzz
```


## Credit

This code was cloned from from:

    https://github.com/MichaelEischer/rcs-fast-export

which in turn was cloned from:

    https://github.com/Oblomov/rcs-fast-export

with PR mods from:

    https://github.com/Oblomov/rcs-fast-export/pull/8
    https://github.com/Oblomov/rcs-fast-export/pull/10

plus a Makefile, rename to `rcs-fast-export`, fix of the top #! line, and `.gitignore` from:

    https://github.com/lcn2/rcs-fast-export

See also the rcs2git(1) tool from:

    https://github.com/lcn2/gitutil/blob/master/rcs2git


# Reporting Security Issues

To report a security issue, please visit "[Reporting Security Issues](https://github.com/lcn2/rcs-fast-export/security/policy)".
