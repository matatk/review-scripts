review-scripts
==============

Here are some \*nix shell scripts to help you review a series of changes to a document managed in a Git repo. They can be used, for example, to assist with regular reviews of standard specifications. They're currently being used to assist an accessibility review of the HTML standard, and aim to be fairly generic, but could be generalised further.

Workflow overview
-----------------

There are three main steps involved...

* **Use `review.init` to begin a new review:** the repo under review is scanned for commits betwixt two dates. The list of commits is filtered, so non-essential ones are discounted. A file is made that lists all of the commits to review, in chronological order.
* **Use `review.next` to fetch the next commit:** you can review it locally using `git show` or, if it's hosted somewhere, on the web. You may be able to find out more context around the commit via its web page, such as related pull requests, issues and discussions.
* **Use `review.record` to log notes about the current commit:** e.g. if you filed some issues, you could list their numbers. A shortcut is provided to mark a commit as not applicable to your current review.

It's also possible to 'park' the current commit for review later on; more on that later.

Two additional scripts are provided to make HTML versions of the list of commits to review (`review.html.todo`) and the list of reviewed commits and related notes (`review.html.done`).

Set-up
------

*These scripts are for \*nix systems. I've run them on macOS mainly, but they should work on Linux, BSD and the Windows Subsystem for Linux.*

Run `make` and the scripts will be copied to your `~/bin/` directory.

If you have [shellcheck](https://github.com/koalaman/shellcheck) installed, it is used to check the scripts before install.

To make things even quicker when performing a review, some command aliases are suggested (in `aliases.sh`); instructions as to how to use them are provided when running `make`.

Detailed workflow steps
-----------------------

1. Move into the checked-out repo containing the document to be reviewed and run `review.init`. A configuration file, `review.config.sh` (currently tuned for reviewing the HTML standard) will be generated in the current directory. You can edit this file to change the parameters of the review.

   Commits between two dates will be found, and you can filter out commits that are not relevant to the review via their messages (e.g. for HTML, 'Meta: ' and 'Editorial: ' commits are filtered).

   The list of commits to review will be saved, in chronological order, to a file (called `review.state.todo` by default) in the current directory. Its format is like the output of `git log --oneline`, for example:

        f38b42ce feat: New home landing page
        285fbb96 fix: Clearer focus indication
        0ae9672d chore: Bump transpiler dependency to 0.42
        . . .

   You don't need to—in fact you shouldn't—edit this file directly though.

   You can make an HTML version of the list of commits to review (which also includes the commit date) by calling the `review.html.todo` script.

2. To pop the next commit off the queue for review, you can use the `review.next` script. Use `review.next txt` to open the commit to review using `git show`, or `review.next web` to open the commit on the web (if it's hosted somewhere). If you call `review.next` again, it won't pop another commit.

3. To record a result, or some notes, for your review, use `review.record`. If the commit is not relevant, use `review.record na`. If it is relevant, use `review.record l <message>`.

   You can make an HTML version of the commits that have been reviewed, with the review messages, using `review.html.done`.

### Parking commits

If you get stuck and need to return to a particular commit later, you can 'park' it and then continue with the review. Two scripts are provided to help with this...

1. Call `review.park` to move the current commit under review to a 'parked' list (named `review.state.parked` by default). Subsequent calls to `review.park` will be operating on newer 'current' commits, so they're added to the end of the parked list, in order to try to preserve their chronology.

2. Use `review.unpark` to bring the oldest commit from the 'parked' list into the list of commits to be reviewed. The popped parked commit is prepended to the todo list, again with the aim of keeping the commits in chronological order. (However, if you've parked more than one commit, and don't review it before calling `review.unpark` again, things will go out of skew chronology-wise.)

   If you have multiple parked commits and want to bring them _all_ back to the start of the todo list, you can issue `review.unpark all`—doing so will keep things in order.

### Online help

All of the scripts support the `-h` option (be sure to pass it as the first argument).

Collaboration
-------------

If you want to share a review across multiple people, you can use the `split` command to create separate commit lists for each reviewer. Carry out the following steps after initialising a review.

1. Use `wc -l review.state.todo` to find out how many commits there are.

2. Decide on the number of commits per person (using this technique, each person will get an almost-equal number of commits to review).

3. Use `split -l <lines-per-person> review.state.todo` to create separate files for each person. You can tweak the generated files' names—more info can be found via `man split`.

Limitations
-----------

There are no tests! Though [shellcheck](https://github.com/koalaman/shellcheck) is used as a linter, at least. The scripts were written to (hopefully :-)) help with a review in progress; if the workflow turns out to be useful, re-writing with [test-driven development](https://en.wikipedia.org/wiki/Test-driven_development) would be a good idea.

The designated order of reviewing commits is chronological. This means that you may review something that is superseded by a more recent commit. There could be some wasted time reviewing things that are replaced later, but it could be valuable to know the history. Something to reflect upon after the current review.

The revisions are filtered for commits that affect a specific source file (so as to concentrate on the specification under review). Only one source file is supported.
