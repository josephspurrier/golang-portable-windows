golang-portable-windows
=======================

Go Programming Language - Portable Environment for Windows

This project allows you to set up a full Go environment in 30 seconds so you can start building Go applications. There is no installation necessary, just extract to your desktop or a portable drive. You can build Go applications using the included portable LiteIDE, the easy-to-use batch scripts, or from plain command prompt. The Go binaries are included so you don't have to build the Go language itself.

## Download
The latest 32-bit and 64-bit release is [v1.5.3-r.1](https://github.com/josephspurrier/golang-portable-windows/releases) (2016-01-17). Previous releases were split into separate 32-bit and 64-bit downloads. It's easier to maintain a single version which allows you to compile either 32-bit or 64-bit by updating the BUILDBIT.txt file. Simply change the text to either 32 or 64 (default) and both LiteIDE and the batch scripts will build for that architecture.

## Beta Release
There is a beta release with Go v1.6beta2. The language itself is in beta so only use it for testing. It's latest release for beta is [v1.6beta2-r.1](https://github.com/josephspurrier/golang-portable-windows/releases) (2016-01-23).

The repository does not contain most of the binaries. Be sure to download the latest release which includes the binaries for Go, LiteIDE, Git, Mercurial, and Diff.

## Overview

If you sat down at your friends computer, to get Go up and running:

* Download the latest zip release
* Extract to a folder
* Double click LiteIDE.cmd

It's that simple.

## Applications

Included is all the original files from [go1.5.3.windows-xxx.zip](http://golang.org/dl/), [LiteIDE X28](https://github.com/visualfc/liteide), [msysGit](https://msysgit.github.io/), [EasyMercurial](http://easyhg.org/), and [DiffUtils](http://gnuwin32.sourceforge.net/packages/diffutils.htm). No changes have been made to any of the files, just extracted to separate folders. The only exception is msysGit which has these additional files from the full portable install: basename.txt, tr.exe, git-pull, git-sh-i18n, and git-merge.

# Using LiteIDE

Just double click LiteIDE.cmd to start up a portable version of LiteIDE. The GOPATH will automatically be set using a local configuration file. If you move your project to another computer, run LiteIDE.cmd on the new computer to change all the paths inside liteide.ini to the new path. If you want to start from a fresh LiteIDE configuration, just delete \liteide_config\locked.txt and run LiteIDE.cmd.

# Using Batch Scripts

If you don't want to use LiteIDE to build your Go applications, you can use the batch scripts in \workspace. All the scripts call __Global.cmd first to set the environment variables and paths. All the scripts are designed to work with the current file structure so no absolute paths are hard coded which makes the scripts very flexible. The "go run" command is not used in any of the scripts because it runs from a temporary location that requires you to add a firewall exception each time it is run - instead "go build" is used to build the app and then run normally. The only differences between the 32-bit and 64-bit releases are _BuildRaceDetector.cmd is removed in 32-bit and _Test.cmd, _TestBenchmark.cmd, and _TestCoverage.cmd do not have the -race flag in 32-bit. Go 32-bit does not support race detection.

```
__Command Prompt.cmd	- Opens a command prompt
__Global.cmd			- Called by all the scripts to set the environment variables and paths
_Build.cmd				- Builds all apps with a main() function in respective directories, sets Version and BuildDate inside app
_BuildRaceDetector.cmd	- Same as _Build.cmd, but includes -race flag which detects race conditions (size of .exe is greatly increased, not for Production)
_BuildRun.cmd			- Same as _Build.cmd, but runs the app as well
_Clean.cmd				- Removes object files from package source directories and corresponding binary
_Document.cmd			- Runs web server and opens a browser to a local version of the documentation for the application
_Embed.cmd				- Creates a syso file with version information (versioninfo.json) and an icon (icon.ico)
_Fix.cmd				- Finds lines of code that use old APIs and makes corrections
_FixDiff.cmd			- Finds lines of code that use old APIs and shows diffs to use newer APIs
_Format.cmd				- Formats lines of code correctly
_Generate.cmd			- Runs commands described by directives within existing files
_Get.cmd				- Downloads the packages named by the import paths
_GetInstall.cmd			- Downloads and installs the packages named by the import paths
_GetUpdate.cmd			- Downloads and force updates the packages named by the import paths
_Install.cmd			- Installs the packages in the /bin directory (will create automatically)
_Lint.cmd				- Installs Lint and then prints out style mistakes
_List.cmd				- Outputs all the packages
_Test.cmd				- Runs all package tests and outputs code coverage as well as any race conditions
_TestBenchmark.cmd		- Runs all package tests and outputs all benchmarks
_TestCoverage.cmd		- Same as _Test.cmd, but then opens a web browser to a local version of the code coverage map
_Vet.cmd				- Examines code and reports suspicious constructs
```

## Text Files
The batch scripts use the .txt files (Packages.txt and GetPackages.txt) to determine which packages are built and tested. There are two rules when using the .txt files:
* Only one package per line
* Any lines that start with `#` are ignored

## How to Use _Get.cmd
To download packages, write each package on a separate line in \workspace\GetPackages.txt and then run _Get.cmd.

## Boilerplate Version and Build Date

One feature I find really useful is the ability to set uninitialized variables at build time using [ldflags](http://stackoverflow.com/questions/11354518/golang-application-auto-build-versioning) for build version and date.

The BuildDate variable is automatically set in \workspace\\__Global.cmd to: YYYYMMDDHHMMSSMM

The Version variable is set in: \workspace\BuildVersion.txt

The LDFLAGS variable is set in \workspace\\__Global.cmd and then used by the scripts:
* _Build.cmd
* _BuildRaceDetector.cmd
* _BuildRun.cmd
* _Install.cmd 

All the boilerplate code is already included in \workspace\src\hello\hello.go.

## Boilerplate Tests

A boilerplate test package is also included at \workspace\src\hello\hello_test.go.

## GCC Support

If you import packages into your workspace that need to be compiled (like github.com/mattn/go-sqlite3), you may receive this error message:

```
exec: "gcc": executable file not found in %PATH%
```

To install gcc and the other executables, I recommend downloading [Win-builds](http://win-builds.org/) and installing the 32-bit version to C:\mingw32 or the 64-bit version to C:\mingw64. Win-builds doesn't actually install, it just extracts the necessary files to those directories so it's nice and clean. LiteIDE and the batch scripts are already configured to use these directories if they exist.
