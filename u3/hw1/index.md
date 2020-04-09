---
title: GitHub Introduction
sidebar: mydoc_sidebar
permalink: 
---

## GitHub in RPP 

+ Note, this class will make heavy use of GitHub 
+ Homework assignments will be submitted to private GitHub repositories: one repository for each student
+ Course projects will also use private GitHub repositories: one repository for each course project (shared among students of each project)
+ Each student will need a personal GitHub account. They can be created [here](https://github.com/personal).
+ GitHub provides an unlimited number of free public repositories to each user. Via GitHub Education students can sign up for free private GitHub accounts (see [here](https://education.github.com)).
+ All private GitHub accounts required for this class will be provided by the instructor via [GitHub Classroom](https://classroom.github.com/)
+ For beginners this [quick guide](https://guides.github.com/activities/hello-world/) may be useful

## What are Git and GitHub?

+ Git is a distributed version control system similar to SVN
+ GitHub is an online social coding service based on Git 
+ Combined Git/GitHub: environment for version control and social coding

## Installing Git
+ [Install](http://git-scm.com/book/en/Getting-Started-Installing-Git) on Windows, OS X and Linux
+ When using it from RStudio, it needs to find the Git executable

## Git Basics from Command-Line

Also try [interactive git tutorial](https://try.github.io/levels/1/challenges/1).

+ Finding help from command-line 

    ```sh
    git <command> --help
    ```

+ Initialize a directory as a Git repository

    ```sh
    git init
    ```
	
+ Add specific files to Git repository (staging area) 

   ```sh
   git add myfile
   ```

+ Add all files recursively 

  To ignore specific files (_e.g._ temp files), list them in a `.gitignore` file in your repository's root directory. Regular expressions are supported. See [here](https://help.github.com/articles/ignoring-files/) for more details.

   ```sh
   git add -A :/
   ```

+ After editing file(s) in your repos, record a snapshot of the staging area 

   ```sh
   git commit -am "some edits"
   ```

## GitHub Basics from Command-Line

1. Generate a new remote repository on GitHub online or use [hub](https://hub.github.com/) command-line wrapper for this. To avoid errors with the online method, do not
   initialize the new repository with README, license, or `.gitignore` files. You can
   add these files after your project has been pushed to GitHub.

   ```sh
   git remote add origin https://github.com/<user_name>/<repos_name>.git
   ```

2. Push updates to remote. Next time one can just use `git push`

    ```sh
    git push -u origin master
    ```

3. Clone existing remote repository
    
    ```sh
    git clone https://github.com/<user_name>/<repos_name>.git
    ```

4. Before working on project, update local git repos 

    ```sh
    git pull 
    ```

5. Make changes and recommit local to remote 

    ```sh
    git commit -am "some edits"; git push -u origin master
    ```

## Exercise

Run the following git/github excercise from the command-line.

```sh 
git clone https://github.com/<user or org>/<repo name> 
cd <repo name>
git pull
touch test # Creates empty file for testing
git add -A
git commit -am "some edits"
git push -u origin master
##-> Edit test file online and then run `git pull` to inspect changes
```

## Online file upload

This could be useful for new users who want to upload their homework assignments to GitHub but are not familiar enough with the command-line yet.

1. Press `Create new file` button on your repository. 
2. Under the file path window add required subdirectory structure and a dummy file name (e.g. `Homework/HW1/dummy.txt`)
3. After this press `Upload files` and upload any file (e.g. homework) to the newly create directory. After this the initial dummy file can be deleted. The latter is necessary since empty directories are not visible on GitHub.

## Using GitHub from RStudio
+ After installing Git (see [here](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)), set path to Git executable in Rstudio: 
	+ Tools `>` Global Options `>` Git/SVN

+ If needed, log in to GitHub account and create repository. Use option `Initialize this repository with a README`. 

+ Clone repository by copying & pasting URL from repository into RStudio's 'Clone Git Repository' window: 
    + File `>` New Project `>` Version Control `>` Git `>` Provide URL

+ Now do some work (_e.g._ add an R script), commit and push changes as follows: 
    + Tools `>` Version Control `>` Commit

+ Check files in staging area and press `Commit Button`

+ To commit changes to GitHub, press `Push Button`

+ Shortcuts to automate above routines are [here](https://support.rstudio.com/hc/en-us/articles/200711853-Keyboard-Shortcuts)

+ To resolve password issues, follow instructions [here](https://github.com/jennybc/stat540_2014/blob/master/seminars/seminar92_git.md). 

