# NightWatch

This will be the development environment for Group 1 to create our crime reporting and monitoring application.

![Our Logo - watching eye on orange background](media/Splash_GitHub_Page.png)
---
## Important Notes

1. This app will be developed using **flutter version <= 3.3.5** (Latest for October 21)

2. Please run `flutter clean` before committing and pushing.

3. Likewise, after pulling please run `flutter pub get` or save the pubspec.yaml file

4. Please use descriptive comments when committing your code!


### Writing Commits

It's best to follow a standard convention of writing commits so as to make it ease make sense of
what changed and why. More about this topic and read about [here](https://www.freecodecamp.org/news/how-to-write-better-git-commit-messages/)

According to best practise, here's our project's format:

> \[**Commit Type**]: Imperative short description 
> 
> \[Optional Body]

An Example:

> feat: Add UML diagram based Report models
>
> Added all classes that make up the Report class as seen on the canvas
> Added the `uuid` package to generate uuids for each Report object

The commit type includes the following:

* **feat** – a new feature is introduced with the changes
* **fix** – a bug fix has occurred
* **chore** – changes that do not relate to a fix or feature and don't modify src or test files (for example updating dependencies)
* **refactor** – refactored code that neither fixes a bug nor adds a feature
* **docs** – updates to documentation such as a the README or other markdown files
* **style** – changes that do not affect the meaning of the code, likely related to code formatting such as white-space, missing semi-colons, and so on.
* **test** – including new or correcting previous tests
* **perf** – performance improvements
* **revert** – reverts a previous commit