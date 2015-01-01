golang-portable-windows
=======================

Go Programming Language - Portable Environment for Windows

Very simply: a Go workspace with all the batch scripts needed to format, build, and test Go programs at extract - no install necessary.

This distribution is a portable workspace with boilerplate Go code as well as a portable version of the Git command-line client.

## Applications

You get both all the original files from [go1.4.windows-amd64.zip](http://golang.org/dl/) and [msysGit](https://msysgit.github.io/). No changes have been made to any of the files, just extracted to separate folders.

## Batch scripts

The scripts in \workspace make it easy to interact with the standard Go tools. All the scripts call __Global.cmd first to set the environment variables and paths. All the scripts are designed to work with the current file structure so no absolute paths are hard coded which makes the scripts very flexible. A few of the scripts use the "go list" command to find all the packages in the workspace.

```
__Command Prompt.cmd	- Opens a command prompt
__Global.cmd		- Called by all the scripts to set the environment variables and paths
_Build.cmd		- Builds all apps with a main() function in respective directories, sets Version and BuildDate inside app
_BuildRaceDetector.cmd	- Same as _Build.cmd, but includes -race flag which detects race conditions (size of .exe is greatly increased, not for Production)
_Clean.cmd		- Removes object files from package source directories and corresponding binary
_Document.cmd		- Runs web server and opens a browser to a local version of the documentation for the application
_Fix.cmd		- Finds lines of code that use old APIs and shows diffs to use newer APIs
_Install.cmd		- Installs the packages in the /bin directory (will create automatically)
_Lint.cmd		- Installs Lint and then prints out style mistakes
_List.cmd		- Outputs all the packages
_Test.cmd		- Runs all package tests and outputs code coverage as well as any race conditions
_TestCoverage.cmd	- Same as _Test.cmd, but then opens a web browser to a local version of the code coverage map
_Vet.cmd		- Examines code and reports suspicious constructs
```

## Boilerplate Version and Build Date

One feature I find really useful is the ability to set uninitialized variables at build time using [ldflags](http://stackoverflow.com/questions/11354518/golang-application-auto-build-versioning).

The BuildDate variable is automatically set in \workspace\__Global.cmd to: YYYYMMDDHHMMSSMM
The Version variable is set in: \workspace\BuildVersion.txt

The LDFLAGS variable is set in \workspace\__Global.cmd and then used by the scripts:
* _Build.cmd
* _BuildRaceDetector.cmd
* _Install.cmd 

All the boilerplate code is already included in \workspace\src\start\start.go.

## Boilerplate Tests

A boilerplate test package is also included at \workspace\src\start\start_test.go. The only test not included is Benchmark.

## Release History

v1.0.0 (2014-12-31)
-------------------
* Added Go v1.4 AMD64 (Programming Language) (2014/12/10)
* Added msysGit Net Install v1.9.4 (Version Control System) (2014/09/29 Preview)
* Added one-click use of go build, go clean, godoc, go tool fix, go install, golint, go list, go test, and go vet
* Added main package and main_test package
* Added code for Version and BuildDate flags
* Added formatting help for documentation in main package
* Added sample tests for main_test package