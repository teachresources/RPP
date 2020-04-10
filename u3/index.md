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

![ ](img/GIT1.png)

# What is GitHUb?

<iframe width="560" height="315" src="https://www.youtube.com/embed/w3jLJU7DT5E" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## What is a repository?

You can think of a repository (_aka_ a repo) as a "master folder", everything associated with a specific project should be kept in a repo for that project. Repos can have folders within them, or just be separate files.

You will have a local copy (on your computer) and an online copy (on GitHub) of all the files in the repository.

### The workflow

<iframe width="560" height="315" src="https://www.youtube.com/embed/KjLycV1IWqc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

The GitHub workflow can be summarised by the "commit-pull-push" mantra.

1. Commit
	* Once you've saved your files, you need to commit them - this means the changes you have made to files in your repo will be saved as a version of the repo, and your changes are now ready to go up on GitHub (the online copy of the repository).
2. Pull
	* Now, before you send your changes to Github, you need to pull, i.e. make sure you are completely up to date with the latest version of the online version of the files - other people could have been working on them even if you haven't.
3. Push
	* Once you are up to date, you can push your changes - at this point in time your local copy and the online copy of the files will be the same.

![ ](img/git.png)

![ ](img/git-and-github-workflow.png)

Each file on GitHub has a history, so instead of having many files like `Dissertation_1st_May.R`, `Dissertation_2nd_May.R`, you can have only one and by exploring its history, you can see what it looked at different points in time.

For example, here is the history for a repo with an R script inside it, as viewed on Github. 

![ ](img/commit.png)

# Create your own repository and project folder structure

To make a repository, go to `Repositories/New repository` - choose a concise and informative name that has no spaces or funky characters in it. This can be your master repo that holds together past and ongoing research, data, scripts, manuscripts. Later on you might want to have more repositories - e.g. a repository associated with a particular project that you want to make public or a project where you are actively seeking feedback from a wider audience. For now, we will focus on organising and using your main repository that holds the files for all your work. With a free GitHub account, you can use public or private respositories. 

__Click on `Initialise repo with a README.md file`__. It's common practice for each repository to have a `README.md` file, which contains information about the project, the purpose of the repository, as well as any comments on licensing and data sources. Github understands several text formats, including `.txt` and `.md`. `.md` stands for a file written in [Markdown](https://en.wikipedia.org/wiki/Markdown). You might have used Markdown before from within `RStudio` to create neatly organised reports of your code and its outputs. You can also use Markdown to write plain text files, for example the file you are reading now was written in Markdown.

You can directly edit your `README.md` file on Github by clicking on the file and then selecting `Edit this file`.

![Github edit file screenshot](img/edit.png)

## Exercise 1: Write an informative README.md file

You can now write the `README.md` file for your repository. To make headings and subheadings, put hashtags before a line of text - the more hashtags, the smaller the heading will appear. You can make lists using `-` and numbers `1, 2, 3, etc.`. __You can discuss the information you want to include among your lab members - here are some things you might want to consider:__

```
- Your name 

- Project title

- Links to website & social media

- Contact details

```
## Exercise 2: Create folders

Discuss among your lab what folders your repository will contain - some examples include: manuscripts, data, figures, scripts, scripts/users/personal_folder_your_name. To make a new folder, click on `Create new file` and add in the name of your new folder, e.g. `manuscripts/` before the file name, in this case a quick `README.md` file. When creating folders within your repo through GitHub's website, you always need to make at least one file associated with them, you can't just create an empty folder. Add a brief explanation of what the folder is for in the `README.md` file, scroll down and click on `Commit new file`. Add a quick message where it says `Create README.md file` in light grey text - we will cover GitHub etiquette later, but for now, when creating/editing files, it's always a good idea to change the default message to a more precise description of what was done and who did it. Stick with the default option of `Commit directly to master branch` - we will explain branches and pull requests at a later stage of the tutorial.

## GitHub etiquette

If you'll be sharing the repository with collaborators and even for your own benefit, it's a good idea to define some rules on how to use the repository before we start working within it - for example what GitHub and coding etiquette should people be following? Is there a prefered folder structure, file naming system?

We can make a new `project-rules.md` file that outlines the rules that people with access to your repository should follow.

## Exercise 4: Write a `project-rules.md` file

Go to your lab's main repository, click on `Create new file` and add `project-rules.md` as a file name. Remember to include the file extension `.md` - otherwise GitHub won't know what's the file format.

> A few GitHub rules:
```
- Keep file paths short and sensible.
- Don't use funky characters and spaces in your file names, these cause trouble because of differences in Mac/Windows systems.
- Always __pull__ before you push in case someone has done any work since the last time you pulled - you wouldn't want anyone's work to get lost or to have to resolve many coding conflicts.
```

# Sync and interact with your repository through `RStudio`

<iframe width="560" height="315" src="https://www.youtube.com/embed/E2d91v1Twcc?start=175" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

The "commit-pull-push" workflow can be embedded within `RStudio` using "Projects" and enabling version control for them - we will be doing that shortly in the tutorial.

__Log into your Github account and navigate to the repository you created earlier__

Click `Clone or download` and copy the HTTPS link.

![Github clone repository screenshot](img/download.png) 

Now open RStudio, click `File/ New Project/ Version control/ Git` and paste the HTTPS link from the Github repository into the `Repository URL:` field. Select a folder on your computer - that is where the "local" copy of your repository will be (the online one being on Github).

![Github clone repository screenshot](img/clone.png) 

Once the files have finished copying across (this may take a while depending on the size of the repo you're joining), you will notice that a few things about your RStudio session have changed: there is a `Git` tab in the top right corner of RStudio, and all the files that are in the repo are now on your computer as well.

You are now ready to start making changes and documenting them through Github!  __Note that you can't push empty folders.__

![RStudio Git staging area screenshot](img/display.png)

You can open some of the files you made online earlier - for example if you click on your `README.md` file, it will open in `RStudio` and you can make changes. Add some more text just for the sake of exemplifying how version control works. Save the file in the same location (i.e., your repository). 

![Git check](img/diff.png)

If you click on the `Git` tab you will see that now your `README.md` file is listed there. Add a tick next to it. Now it has an `M` - this means you have modified the file. If there's an `A`, that's an added file, and a `D` is a deleted file.

If you select the `README.md` file and click on `Diff`, you will see the changes you have made. Once the file is selected, it is `staged`, ready to be commited to Github.

![Git diff](img/gitdiff.png)

Click on `Commit` and add in your `commit message` - aim to be concise and informative - what did you do? Once you have clicked on `Commit`, you will get a message about what changes you have made.

<!--![RStudio Git commit interface screenshot]({{ site.baseurl }}/assets/img/tutorials/git/commit_window.png) -->

__If you are making your first ever commit, clicking on `Commit` may result in an error message - git will tell you that you need to configure your username and email. This is easily done, and you only need to do it once, afterwards you can commit-pull-push at your convenience!__

In the top right corner of the RStudio screen, click on `Terminal`. 

<!--![RStudio terminal screenshot]({{ site.baseurl }}/assets/img/tutorials/git/shell.png) -->

### Copy the following code:

```
git config --global user.email your_email@example.com
# Add the email with which you registered on GitHub and click Enter

git config --global user.name "Your GitHub Username"
# Add your username and click Enter
```

If it worked fine, there will be no messages, you can close the shell window and do your commit again, this time it will work!

You will see a message saying that your branch is now one commit ahead of the `origin/master` branch - that is the branch that is on Github - we now need to let Github know about the changes we have made.

<!-- ![RStudio Git branch status screenshot]({{ site.baseurl }}/assets/img/tutorials/git/git4.png) -->

We can't repeat it enough: __always `Pull` before you `Push`.__ `Pull` means that you are retrieving the most recent version of the Github repository onto your local branch - this command is especially useful if several people are working within the same repository - imagine there was a second script examining soil pH along this elevation gradient, and your collaborator was working on it the same time as you - you wouldn't want to "overwrite" their work and cause trouble. In this case, you are the only one working on these files, but it's still good to develop the practice of pulling before you push. Once you've pulled, you'll see a message that you are already up to date, you can now push! Click on `Push`, wait for the loading to be over and then click on `Close` - that was it, you have successfully pushed your work to Github!

Go back to your repository on Github, where you can now see all of your updated files online.

Click on your script file and then on `History` - this is where you can see the different versions of your script - obviously in real life situations you will make many changes as your work progresses - here we just have two. Thanks to Github and version control, you don't need to save hundreds of almost identical files (e.g. `Dissertation_script_25thFeb.R`, `Dissertation_script_26thFeb.R`) - you have one file and by clicking on the different commits, you can see what it looked like at different points in time.


__You are now ready to add your scripts, plots, data files, etc. to your new project directory and follow the same workflow as outlined above - stage your files, commit, pull, push.__

## Potential problems

Sometimes you will see error messages as you try to commit-pull-push. Usually the error message identifies the problem and which file it's associated with, if the message is more obscure, googling it is a good step towards solving the problem. Here are some potential problems that might arise:

### Code conflicts

While you were working on a certain part of a script, someone else was working on it, too. When you go through commit-pull-push, GitHub will make you decide which version you want to keep. This is called a code conflict, and you can't proceed until you've resolved it. You will see arrows looking like `>>>>>>>>>` around the two versions of the code - delete the version of the code you don't want to keep, as well as the arrows, and your conflict should disappear.

### Pushing the wrong files

If you accidentally push what you didn't intend to, deleted many things (or everything!) and then pushed empty folders, you can revert your commit. You can keep reverting until you reach the point in time when everything was okay. This is an easy way out if you're the only person working in the repository - __be aware that if there are other people that have committed to the repository, reverting will also undo all of their work, as reverting refers to the repository as a whole, not just your own work in it.__

Using these "undo" commands can be daunting, so make sure you read up on the different commands before you attempt anything that may delete work permanently: [here's a starter](https://www.atlassian.com/git/tutorials/undoing-changes/git-revert). It's a good idea to regularly back up your repository to an external hard drive _juuuust_ in case!  

#  Sync and interact with your repository through the command line

Traditionally, Git uses the command line to perform actions on local Git repositories. In this tutorial we ignored the command line but it is necessary if you want more control over Git. There are several excellent introductory guides on version control using Git, e.g. [Prof Simon Mudd's Numeracy, Modelling and Data management guide](http://simon-m-mudd.github.io/NMDM_book/#_version_control_with_git), [The Software Carpentry guide](https://swcarpentry.github.io/git-novice/), and this [guide from the British Ecological Society Version Control workshop](https://github.com/BES2016Workshop/version-control). For more generic command line tools, look at this [general cheat sheet](https://www.git-tower.com/blog/command-line-cheat-sheet) and this [cheat sheet for mac users](https://github.com/0nn0/terminal-mac-cheatsheet). We have also created a table and flow diagram with some basic Git commands and how they fit into the Git/Github workflow. Orange lines refer to the core workflow, the blue lines describe extra functions and the green lines deal with branches:

<table>
  <tr>
    <th>Command</th>
    <th>Origin</th>
    <th>Destination</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><code>git clone REPO_URL</code></td>
    <td>Personal Github</td>
    <td>Local</td>
    <td>Creates a local copy of a Github repo. The URL can be copied from Github.com by clicking the `Clone or Download` button.</td>
  </tr>
  <tr>
    <td><code>git add README.md</code></td>
    <td>Working Dir</td>
    <td>Staging Area</td>
    <td>Add "README.md" to staging area.</td>
  </tr>
  <tr>
    <td><code>git commit</code></td>
    <td>Staging Area</td>
    <td>Local</td>
    <td>Commits changes to files to the local repo.</td>
  </tr>
  <tr>
    <td><code>git commit -a</code></td>
    <td>Working Dir</td>
    <td>Local</td>
    <td>adds and commits all file changes to the local repo.</td>
  </tr>
  <tr>
    <td><code>git pull</code></td>
    <td>Personal Github</td>
    <td>Local</td>
    <td>Retrieve any changes from a Github repo.</td>
  </tr>
  <tr>
    <td><code>git push</code></td>
    <td>Local</td>
    <td>Personal Github</td>
    <td>Sends commited file changes to Github repo.</td>
  </tr>
  <tr>
    <td><code>git merge</code></td>
    <td>Other branch</td>
    <td>Current branch</td>
    <td>Merge any changes in the named branch with the current branch.</td>
  </tr>
  <tr>
    <td><code>git checkout -b patch1</code></td>
    <td>NA</td>
    <td>NA</td>
    <td>Create a branch called "patch1" from the current branch and switch to it.</td>
  </tr>
  <tr>
    <td><code>git init</code></td>
    <td>NA</td>
    <td>NA</td>
    <td>Initialise a directory as a Git repo.</td>
  </tr>
  <tr>
    <td><code>git log</code></td>
    <td>NA</td>
    <td>NA</td>
    <td>Display the commit history for the current repo</td>
  </tr>
  <tr>
    <td><code>git status</code></td>
    <td>NA</td>
    <td>NA</td>
    <td>See which files are staged/unstaged/changed</td>
  </tr>
  <tr>
    <td><code>git diff</code></td>
    <td>NA</td>
    <td>NA</td>
    <td>See the difference between staged uncomitted changes and the most recent commit</td>
  </tr>
  <tr>
    <td><code>git stash</code></td>
    <td>NA</td>
    <td>NA</td>
    <td>Save uncommitted changes in a temporary version and revert to the most recent commit</td>
  </tr>
</table>

Below is a quick exercise so you can familiarise yourself with these command line tools. There are a few ways to use interact with Git using the terminal:

1. If you are already in RStudio on a Mac or Linux machine, you can open a terminal within RStudio by going to `Tools -> Terminal -> New Terminal` in the menu. 
2. If you are on a Mac or Linux machine you could just open a terminal program and run Git from there. Most Mac and Linux machines will have Git installed by default. On Mac you can go open a terminal by going to: `Applications/Utilities/Terminal.app`.
3. If you are on a personal Windows machine, you can run Git using Git Bash, which can be installed when you installed Git.

Once you have opened a terminal using one of the above methods, start by creating a folder somewhere on your local system called `git_test`, using the `mkdir` (make directory) command by typing the following into the terminal and hitting "Enter":

```shell
mkdir git_test
```

Then enter that folder using `cd` (change directory):

```shell
cd git_test
```

Then, make the folder into a Git repository:

```shell
git init
```

Now the folder has been made into a Git repository, allowing you to track changes to files. Now, lets create a `README.md` file inside the repository and put some text in it, using whatever text editor you are comfortable with. Make sure to place this `README.md` file into the repository folder on your device so it can be found! 

## Creating a README from scratch

Your computer probably comes with a text editor, such as Notepad for Windows or TextEdit for Mac. Open a new doc, type your information, and save it as `README.md` (with TextEdit, you might have to save it as .rf first, then change the extension in your Finder.) 

If you want to do it from the comfort of RStudio, you can create a new RMarkdown file, and save it while changing the extension from `.Rmd` to `.md`. 

Now, to add the file to be tracked by the Git repository:

```shell
git add README.md
```

The file has now been added to the staging area, but has not yet been committed to a version of the repository. To commit a version:

```shell
git commit -m "adding README"
```

You then have to enter a commit message using the text editor which appears, If you have selected Vim as the default text editor, you will need to press `i` before you can type, then `Esc` when you are finished typing. To save and exit, type `:wq`.

Currently, the Git repository is still only on our local computer. Versions are being committed, but they are not being backed up to a remote version of the repository on Github. Go to Github and create a repository called `git_test`, like you did earlier on in the workshop, but this time don't create a `README.md` because we have just made one on the local computer. Now, copy the HTTPS link for that repository. In the terminal, link the local Git repository with the remote repository using the following code, replacing `<HTTPS_LINK>` with the link you copied:

```shell
git remote add origin <HTTPS_LINK>
```

Then make the first push to that newly linked remote repository:

```shell
git push -u origin master
```

Now you can continue editing files, adding changes (`git add <FILE>`), committing changes (`git commit`), pulling (`git pull`) and pushing (`git push`) changes, similar to the process you did with clicking buttons in RStudio. Feel free to explore some of the more advanced commands laid out in the table and flow diagram above. You can also check out a more advanced command line tutorial written by [Prof Simon Mudd for Numeracy, Modelling and Data management guide](http://simon-m-mudd.github.io/NMDM_book/#_version_control_with_git).
