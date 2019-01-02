# Modular Emacs Startup Scripts

There have been a number of attempts to make the Emacs experience easier for new users. There have also been various utilities to make setting up an Emacs configuration easier for experienced users.

This project aims to achieve both goals.

It is largely inspired by the now-deprecated "Emacs Starter Kit" projects, and the [Emacs 24 Starter Kit](https://eschulte.github.io/emacs24-starter-kit/).

Goals are:

1. Break initialization into 2 parts.

   1. The first would include the essential infrastructure for finding and installing third-party packages, and configuration variables to enable/disable modules, and create local customizable copies for users. 
   
   2. The second part is the modules themselves. Each one is focused on a narrow set of tasks, such as setting up a particular mode or handling a particular file extension.

2. Use .org files and literate programming to extensively document both the infrastructure and the modules. This is crucial to making the project useful for newcomers.

# Archived

As I'm no longer using Emacs as my general-purpose editor, this has not been maintained in some time.
