# Contributing New Material

Data Carpentry is an open source project, and we welcome contributions of all
kinds: new and improved lessons, bug reports, and small fixes to existing
material are all useful.

By contributing, you are agreeing that Data Carpentry may redistribute your work
under [these licenses](LICENSE.md).


**Table of Contents**

*   [Working With GitHub](#working-with-github)
*   [Locations and Formats](#locations-and-formats)
*   [FAQ](#faq)


## Working With GitHub

**NOTE: this repository uses `gh-pages` as our default branch.**

1.  Fork the `datacarpentry/R-ecology` repository on GitHub.

2.  Clone that repository to your own machine. (It is also possible to make minor edits right on GitHub.)

3.  Create a branch from `gh-pages` for your changes.
    Give your branch a meaningful name,
    such as `fixing-typos-r-ecology-lesson`
    or `adding-tutorial-on-visualization`.

4.  Make your changes, commit them, and push them to your repository on GitHub.

5.  Send a pull request to the `gh-pages` branch of the datacarpentry
    repository for this lesson at http://github.com/datacarpentry/R-ecology

If it is easier for you to send them to us some other way,
please mail us at
[board@datacarpentry.org](mailto:board@datacarpentry.org).
Given a choice between you creating content or wrestling with Git,
we'd rather have you doing the former.


## Locations and Formats

Eeach lesson contains files such as `00-intro.md`, `01-filedir.md` and so on.
(We use two digits followed by a one-word topic key to ensure files appear in
the right order when listed.)

For the R material, lessons must be written in RMarkdown. A Makefile converts
the Rmd files into HTML that are processed by Jekyll (the tool GitHub uses to
create websites) as explained in [the README file](README.md).

Currently, the Makefile also generates the README file from `index.md`.

We use the `purl()` function from `knitr` to generate a skeleton file that
contains code to be distributed to the workshop participants. It's useful in
particular for error-prone pieces of code (e.g., if it contains long URLs).

## Datasets

We don't store data for lessons inside the lesson repositories. For completed
lessons the data should be publicly available in a data repository appropriate
to the data type. For lesson development the data may be provided in any way
that is convenient including posting to a website, on
[figshare](http://figshare.com/), a public dropbox link, a
[GitHub gist](https://gist.github.com), or even included in the PR. Once the PR
is ready to merge the data should be placed in the
[official data repository](http://figshare.com/articles/Portal_Project_Teaching_Database/1314459)
and all links to the data updated.

## Formatting of the material

To ensure a consistent formatting of the lessons, we recommend the following
guidelines:

* No trailing white space
* Wrap lines at 80 characters (unless it breaks URLs)
* Use unclosed atx style headers (see below):

```
## Use this format for headers

And not this format
-------------------
```

## FAQ

*   *Where can I get help?*
    <br/>
    Mail us at [board@datacarpentry.org](mailto:board@datacarpentry.org),
    come chat with us on [our IRC channel](irc://moznet/sciencelab),
