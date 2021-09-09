# Overview

- Part 1: Introduction to version control software (Git & GitHub)
	- Version control software
		- Different version control models
	- Git software
	- GitHub website
- Part 2: Using GitHub for hosting code, data, manuscripts, documentation, and web content
	- Publishing Stata/R software on GitHub
	- The __`github`__ Stata package
		- Searching, installing, and managing Stata packages
		- Building package installation files
	- Publishing on GitHub
		- Software documentation
		- Data analysis code
		- Data 
		- Manuscripts, etc.
	- Collaborating via GitHub


# Criteria for a discussion

- What are our demands from a perfect open-science platform? 
	- What features do we need?
	- How these features change across disciplines? 
	- How easy would it be to integrate such a platform in classroom for education?
- Points to consider
	- Functionality of Git and GitHub
	- Familiarity / Learning curve
	- Scalability
	- Openness
	- Sustainability
	- Community
	- Support
	- Costs
	- Efficiency



# Version control software
- Version control software are used everyday (backing up smartphones, computers, etc)
- A version control software documents changes made to files
	- Helps with recalling specific versions later
- It is not limited to programming code; changes made to most types of files can be monitored
- It is extensively used for individual work as much as teamwork 
- Examples of different usages
	- Web designers
	- Writers
	- A programmer
		- What updates caused a problem
	- A team of programmers
		- What update caused a problem, who introduced the error, when, and in which part of the code
	- Backing up the project at each step
		- If you ruin a file or remove it accidentally you can back it up

# Version control software

- Several version control software exist, some made by Microsoft, IBM, Autodesk, etc.  
- Version control software have different architecture models
	- Local version control 
	- Client-server model (Centralized Version Control System), where only a single repository exists on the server for all users
		- Users do not have a local clone of the project
		- users need internet access
		- Hierarchical collaboration within groups is not possible
	- Distributed model, where every user works on his own copy of the repository
		- Can be extended for users without a writing access to the original repository
		- Clients fully mirror the repository, including its full history
		- Every clone is really a full backup of all the data
		- Hierarchical workflow can be planned, collaboration can be within groups

# Local version control 

- Built-in within many operating systems for backup
- Useful for individual work
- Not useful for collaborative work


![Local version control (from __git-scm.com__)](./images/local.png)

# Client-server model (Centralized)

![Client-server version control (from __git-scm.com__)](./images/centralized.png)


# Distributed Version Control Systems

![Distributed version control (from __git-scm.com__)](./images/distributed.png)

# Git 
- Git is developed by _Linus Torvalds_ in 2005 to meet the demands of maintaining Linux Kernel 
	- They used _BitKeeper_ vesion control software prior to developing Git
	- They needed a fast version control that would be
		- fully based on distributed model
		- able to handle large projects
		- able to handle non-linear development, where a high number of branches evolve in parallel 
- Git is a Distributed Version Control (DVC) system 
- The _git-scm.com_ website provide plenty of free resources about Git
- Working with Git has a learning curve
	- Git is based on Command line interface (CLI)

# Git 

- You clone the repository locally, which is a full backup of the project
- To update the repository, you do not need internet. Everything is stored locally. 
- Once the code is updated, you _commit_ it, to register the changes in the local database
- Collaborating via Git requires a server; Git is not a server itself
	- To merge the new changes you have made, make a _pull request_ 
	- This is the only part where internet connection is needed
- Download Git from https://git-scm.com/downloads


# Git GUI

Using a graphical user interface can greatly help with working with Git. The GitHub 
application can be used for managing files locally

- Rstudio (Mac, Windows, Linux)
	- Ideal for managing data analysis and documentation within a version control
- SmartGit (Mac, Windows, Linux)
- GitHub application for Mac and Windows

![creating a git database within Rstudio](./images/project.png)

# New repository

![Creating a new repository for a project](./images/newrepo.png)

# Cloning existing repository

![Clone a repository with a URL](./images/clone.png)

# Committing/discarding changed files

![Staging to committing or discard changes](./images/areas.png)

# Committing/discarding changed files

![Staging to committing or discard changes](./images/commit-discard.png)


# Learn more about Git 

![Pro Git eBook is available for free from __git-scm.com__](./images/progit.png)



# GitHub

- GitHub is a social coding site that offers plenty of features for collaboration on software such as
	- tracking issues
	- documentation platform
	- managing tasks
	- Git version control 
- the largest host for Git repositories and also the largest code hosting site
- The preeminent advantage of GitHub is its social nature.
	- GitHub is a combination of Git with a social media
	- developers broadcast their coding exercise
	- follow others’ activities
	- audit a repository
	- discover recent projects
	- collaborate 
	- the pro-social characteristics of GitHub promotes project dissemination
	- peer-reviewing the code

# GitHub

- GitHub repositories can be private or public
- GitHub utilizes a _pull-based development model_ 
	 - it permits anyone to view, fork, and contribute to any public repository on GitHub
	 - The pull-based development model relies on a DVC for tracking changes and contributions
- Contributing to a project via GitHub happens in two ways
	 - Direct change, for those who have writing access to the repository
	 - or by _forking_ the repository, creating a copy of the repository
	 	- Changes to the original repository can be made through submitting a _pull request_
		- If accepted by the repository owner/maintainer, the change will be incorporated in the repository

---

GitHub is dominated by programmers, but other research fields are rapidly catching up

![Clone a repository with a URL](./images/growth.png)

---

![Number of Stata repositories and packages by creation date](./images/githubstata.png)

# Hosting Data on GitHub

- Version control can help with data management 
	- e.g. "Open Exoplanet Catalogue", is a database of all discovered extra-solar planets, hosted on GitHub
- Git is more than enough for text-based data (CSV, XML, JSON, etc.), but has difficulties with binaries
	- Changes (diffs) are not human-readable in binaries
	- Merging edited binary files is even a bigger challenge for Git
- Try to use text-based file formats for the best results
	- e.g. instead of using Stata's and R's native data formats, use CSV file formats, if possible
		 - Any changed observation or value can can be tracked
- On GitHub, no repository is necessarily permanent and the repo's owners can take it down. 
	- Your clone of the repository will not be removed
	- Use other websites for making permanent URL links with Digital Object Identifiers (DOI) for your publication
		- use https://figshare.org/ or https://zenodo.org/ for permanent URL
		- https://guides.github.com/activities/citable-code/


# Collaboration on text documents

- GitHub cannot show what has changed in a Microsoft Word Docx file, it only notifies that it has changed
- Many authors publish the LaTeX or Markdown source of their free ebooks via GitHub
- Open formats such as XML or RTF can be viewed on GitHub although their markup annotation is complex and not human readable
- The best results can be obtained with plain text documents such as LaTeX and particularly Markdown
	- Use LaTeX if the document requires a complex layout
	- Use Pandoc to convert Markdown documents to Docx, while applying a complex layout
- Remember that the biggest benefit of GitHub is its social nature; try to keep your files human readable and easy to read for anyone. 

#Collaborative software documentation on GitHub

- GitHub offers a Markdown-based software documentation platform, called __Wiki__
	- GitHub Wiki can be used for any type of collaborative documentation about the repository
- The documentation is a separate _sub-repository_, that can be cloned by anyone
	 - Software documentation can be collaborative
	 - Can be updated automatically, by exporting Markdown documentation (e.g. using __`markdoc`__)

- GitHub also offers a web host for each repository to publish a site 

#Collaborative software documentation on GitHub

![An example of Wiki software documentation](./images/wiki.png)





# Hosting Statistical code on GitHub

- Many R and Stata users develop their statistical packages on GitHub
- All R packages hosted on CRAN, also exist on GitHub 
	- https://github.com/cran
	- This allows anyone to navigate through the code and see the changes made to a package
- For Stata, the __`github`__ package, provides an alternative to SSC
	- It can search, install, and manage statistical software for Stata
	- It allows installing previous releases of a statistical package and their dependencies
	- It allows modularizing Stata packages, where other packages can be specified as dependencies and be installed automatically 
	- It encourages collaboration on statistical software for Stata

# The __`github`__ package for Stata

     . net install github, from("https://haghish.github.io/github/")

![Syntax of the __`github`__ package](./images/syntax.png)

# Searching GitHub for Stata packages/repositories

![Example of searching GitHub for a Stata package](./images/search.png)

# Installing Previous releases of a Stata packages

- The __`github`__ package also allows installing older releases
- Software rapidly change and older syntax might not be available in newer releases
- Archiving older releases is necessary to improve reproducibility
	- CRAN archives all versions of a released R package
	- SSC does not archive Stata package versions and only hosts the latest version
	

![Example of viewing previous versions of a Stata package](./images/versions.png)

# Managing and updating installed Stata packages

- The __`github`__ package includes commands for managing and updating installed packages
- The __`github list`__ command
	- lists installed packages
	- Current version of the packages
	- Checks whether there is a new release available
	
![Managing and updating installed Stata package](./images/update.png)

# Building a Stata package for GitHub

- The __`github`__ package also includes a command for generating package installation files. The package installation files 
	- help the repository to be discovered in search
	- document the creation and update dates as well as the software version
	
![Generating package installation files with __`github`__ package](./images/make.png)




