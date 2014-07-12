# Shellscripts

There are a number of commands and hooks that I use frequently. This repo gathers them in one place.

### Quickstart

Install this on a new host by doing:
	
	curl -sL http://bit.ly/weirdfire | sh

## Commands

The following global commands are added by this package:

 * `shs <command>` - lets you do stuff with the Shellscripts repo (upgrade, push, etc.)

## Hooks

Hooks add and remove commands based on the working environment.

### SCM hooks

The following shortcuts are added when working inside a repository:

  * `st|status` - shows the current status of the repo
  * `ci` - commits files; the first argument is the commit message and the rest are the files/dirs to commit
  * `add` - starts tracking files and/or stages them in the current commit
  * `push` - pushes the repo
  * `pull` - pulls the repo
  * `log` - calls the appropriate log command
  * `rec|record` - allows you to select lines to include in the current commit

### Docker hooks

In a directory that contains a `Dockerfile` the following commands are added:

 * `build` - does docker build (see Tagging)
 * `push` - does a docker push of the latest built tag
 * `run` - runs the latest built tag
 * `shell` - force runs a shell on the latest tag
 * `start` - runs and detaches from the container
 * `stop` - stops a previously started/detached container
 * `logs` - runs docker logs on the previously started/detached container

If you create the following files, their contents change the docker commands:

 * `.dockername` - the name of the image to build

