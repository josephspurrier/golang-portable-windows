golang-portable-windows
=======================

Go Programming Language - Portable Environment for Windows

This project is helpful for someone that wants to test Go on Windows within 30 seconds.

Very simply: a Go workspace with all the batch scripts needed to format, build, and test Go programs at extract - no install necessary.

This distribution is a portable workspace with boilerplate Go code as well as a portable version of the Git command-line client.

## Download
The latest release is [v1.2.0](https://github.com/josephspurrier/golang-portable-windows/releases/tag/1.2.0) (2014-01-04).

The repository does not contain any binaries. Be sure to download the latest release which includes the binaries for Go and Git.

## Overview

This project is a turnkey solution for building Go program. Personally, I don't like installing programs on Windows, I'd rather run a portable version of software which I why I created this project.

When I started using Go (without installing), I had to figure out all the environment paths, download a portable version of git, add an environmental flag with git to prevent SSL errors, learn what tools are in Go, and then learn the syntax for each of the tools. It took hours to figure out how to do all of those.

Building a Go program is simple:
```
go build {package}
```

But there are tasks that require much more typing like generating an HTML coverage map and then displaying in your web browser.
```
go test -coverprofile="%GOPATH%\test.tmp" -race -cover {package}
go tool cover -html="%GOPATH%\test.tmp"
```

If you are typing in go build {package} or even using the arrow keys to find the command in the console history and then pressing Enter, you are wasting time.

Just double click any of the scripts and the correct Go commands will run. You don't have to specify the package or files - it will use the built in command "go list" to automatically build, test, format, clean, fix, or lint all the files in your workspace.

From an ease of use standpoint, if you sat down at your friends computer, to get Go up and running:

* Download the latest zip release of my project
* Extract to a folder
* Double click \workspace\_Build.com
* You can now run the Hello demo app: \workspace\src\start\start.exe

It's that simple.

## Applications

Included is all the original files from [go1.4.windows-amd64.zip](http://golang.org/dl/) and [msysGit](https://msysgit.github.io/). No changes have been made to any of the files, just extracted to separate folders.

## Batch Scripts

The scripts in \workspace make it easy to interact with the standard Go tools. All the scripts call __Global.cmd first to set the environment variables and paths. All the scripts are designed to work with the current file structure so no absolute paths are hard coded which makes the scripts very flexible. A few of the scripts use the "go list" command to find all the packages in the workspace.

```
__Command Prompt.cmd	- Opens a command prompt
__Global.cmd			- Called by all the scripts to set the environment variables and paths
_Build.cmd				- Builds all apps with a main() function in respective directories, sets Version and BuildDate inside app
_BuildRaceDetector.cmd	- Same as _Build.cmd, but includes -race flag which detects race conditions (size of .exe is greatly increased, not for Production)
_Clean.cmd				- Removes object files from package source directories and corresponding binary
_Document.cmd			- Runs web server and opens a browser to a local version of the documentation for the application
_Fix.cmd				- Finds lines of code that use old APIs and shows diffs to use newer APIs
_Get.cmd				- Downloads and installs the packages named by the import paths
_Install.cmd			- Installs the packages in the /bin directory (will create automatically)
_Lint.cmd				- Installs Lint and then prints out style mistakes
_List.cmd				- Outputs all the packages
_Test.cmd				- Runs all package tests and outputs code coverage as well as any race conditions
_TestBenchmark.cmd		- Runs all package tests and outputs all benchmarks
_TestCoverage.cmd		- Same as _Test.cmd, but then opens a web browser to a local version of the code coverage map
_Vet.cmd				- Examines code and reports suspicious constructs
```
## How to Use _Get.cmd
To download packages, write each package on a separate line in \workspace\GetPackages.txt and then run _Get.cmd.

## Boilerplate Version and Build Date

One feature I find really useful is the ability to set uninitialized variables at build time using [ldflags](http://stackoverflow.com/questions/11354518/golang-application-auto-build-versioning) for build version and date.

The BuildDate variable is automatically set in \workspace\__Global.cmd to: YYYYMMDDHHMMSSMM
The Version variable is set in: \workspace\BuildVersion.txt

The LDFLAGS variable is set in \workspace\__Global.cmd and then used by the scripts:
* _Build.cmd
* _BuildRaceDetector.cmd
* _Install.cmd 

All the boilerplate code is already included in \workspace\src\start\start.go.

## Boilerplate Tests

A boilerplate test package is also included at \workspace\src\start\start_test.go.
