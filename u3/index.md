---
# Page settings
layout: default
head_title: Project Management
keywords:
comments: false

# Hero section
title: Project Management<br>GitHub Introduction 
description: >

# Micro navigation
micro_nav: false

# Page navigation
page_nav:
    prev:
        content: R and RStudio
        url: '/u2/'
    next:
        content: Intro R
        url: '/u4/'
---

# GitHub in RPP 

+ Note, this class will make heavy use of GitHub 
+ Homework assignments will be submitted to private GitHub repositories: one repository for each student
+ Course projects will also use private GitHub repositories: one repository for each course project (shared among students of each project)
+ Each student will need a personal GitHub account. They can be created [here](https://github.com/personal).
+ GitHub provides an unlimited number of free public repositories to each user. Via GitHub Education students can sign up for free private GitHub accounts (see [here](https://education.github.com)).
+ All private GitHub accounts required for this class will be provided by the instructor via [GitHub Classroom](https://classroom.github.com/)
+ For beginners this [quick guide](https://guides.github.com/activities/hello-world/) may be useful

# Get familiar with version control, Git and GitHub


## What is version control?

![“Piled Higher and Deeper” by Jorge Cham, http://www.phdcomics.com](img/phd101212s.png)

Version control allows you to keep track of your work and helps you to easily explore the changes you have made, be it data, coding scripts, notes, etc. You are probably already doing some type of version control, if you save multiple files, such as `Dissertation_script_25thFeb.R`, `Dissertation_script_26thFeb.R`, etc. This approach will leave you with tens or hundreds of similar files, making it rather cumbersome to directly compare different versions, and is not easy to share among collaborators. With version control software such as [Git](https://git-scm.com/), version control is much smoother and easier to implement. Using an online platform like [Github](https://github.com/) to store your files means that you have an online back up of your work, which is beneficial for both you and your collaborators.

Version control systems start with a base version of the document and then record changes you make each step of the way. You can think of it as a recording of your progress: you can rewind to start at the base document and play back each change you made, eventually arriving at your more recent version.

![](img/play-changes.svg)

Once you think of changes as separate from the document itself, you can then think about “playing back” different sets of changes on the base document, ultimately resulting in different versions of that document. For example, two users can make independent sets of changes on the same document.

![](img/versions.svg)

Unless multiple users make changes to the same section of the document - a conflict - you can incorporate two sets of changes into the same base document.

![](img/merge.svg)

A version control system is a tool that keeps track of these changes for us, effectively creating different versions of our files. It allows us to decide which changes will be made to the next version (each record of these changes is called a commit), and keeps useful metadata about them. The complete history of commits for a particular project and their metadata make up a repository. Repositories can be kept in sync across different computers, facilitating collaboration among different people.

Git uses the command line to perform more advanced actions and we encourage you to look through the [extra resources](https://towardsdatascience.com/getting-started-with-git-and-github-6fcd0f2d4ac6), to get more comfortable with Git. But until then, here we offer a gentle introduction to syncing RStudio and Github, so you can start using version control in minutes.

## What are the benefits of using version control?

Having a GitHub repo makes it easy for you to keep track of collaborative and personal projects - all files necessary for certain analyses can be held together and people can add in their code, graphs, etc. as the projects develop. Each file on GitHub has a history, making it easy to explore the changes that occurred to it at different time points. You can review other people's code, add comments to certain lines or the overall document, and suggest changes. For collaborative projects, GitHub allows you to assign tasks to different users, making it clear who is responsible for which part of the analysis. You can also ask certain users to review your code. For personal projects, version control allows you to keep track of your work and easily navigate among the many versions of the files you create, whilst also maintaining an online backup. 

## How does version control work?

### What is a repository?

You can think of a repository (_aka_ a repo) as a "master folder", everything associated with a specific project should be kept in a repo for that project. Repos can have folders within them, or just be separate files.

You will have a local copy (on your computer) and an online copy (on GitHub) of all the files in the repository.

### The workflow

The GitHub workflow can be summarised by the "commit-pull-push" mantra.

1. Commit
	* Once you've saved your files, you need to commit them - this means the changes you have made to files in your repo will be saved as a version of the repo, and your changes are now ready to go up on GitHub (the online copy of the repository).
2. Pull
	* Now, before you send your changes to Github, you need to pull, i.e. make sure you are completely up to date with the latest version of the online version of the files - other people could have been working on them even if you haven't.
3. Push
	* Once you are up to date, you can push your changes - at this point in time your local copy and the online copy of the files will be the same.

Each file on GitHub has a history, so instead of having many files like `Dissertation_1st_May.R`, `Dissertation_2nd_May.R`, you can have only one and by exploring its history, you can see what it looked at different points in time.

For example, here is the history for a repo with an R script inside it, as viewed on Github. Obviously it took me a while to calculate those model predictions!










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

