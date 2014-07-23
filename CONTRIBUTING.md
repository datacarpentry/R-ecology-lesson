Contributing New Material
=========================

Data Carpentry is an open source project,
and we welcome contributions of all kinds:
new and improved lessons,
bug reports,
and small fixes to existing material are all useful.

By contributing,
you are agreeing that Data Carpentry may redistribute your work under
[these licenses](LICENSE.md).


**Table of Contents**

*   [Working With GitHub](#working-with-github)  
*   [Locations and Formats](#locations-and-formats)
*   [FAQ](#faq)

Working With GitHub
-------------------

1.  Fork the `datacarpentry/datacarpentry` repository on GitHub.

2.  Clone that repository to your own machine.

3.  Create a branch from `master` for your changes.
    Give your branch a meaningful name,
    such as `fixing-typos-in-novice-shell-lesson`
    or `adding-tutorial-on-visualization`.

4.  Make your changes, commit them, and push them to your repository on GitHub.

5.  Send a pull request to the `master` branch of the main datacarpentry 
    repository at http://github.com/datacarpentry/datacarpentry.

If it is easier for you to send them to us some other way,
please mail us at
[board@datacarpentry.org](mailto:board@datacarpentry.org).
Given a choice between you creating content or wrestling with Git,
we'd rather have you doing the former.


Locations and Formats
---------------------

Every lesson has a sub-directory of its own,
while individual topics are files in that directory.
For example,
the `lessons/shell` directory holding our introduction to the shell
contains the files
`00-intro.md`,
`01-filedir.md`
and so on.
(We use two digits followed by a one-word topic key
to ensure files appear in the right order when listed.)

Lessons may be written in Markdown,
as IPython Notebooks,
or in other formats.
However,
as explained in [the README file](README.md),
Jekyll (the tool GitHub uses to create websites)
only knows how to handle Markdown and HTML.
if some other format is used,
the author of the lesson must
add the generated Markdown to the repository.
This ensures that people who *aren't* familiar with some format
don't have to install the tools needed to work with it
(e.g.,
R programmers don't have to install the IPython Notebook).

> If a lesson is in a format we don't already handle,
> the author must also add something to the Makefile
> to re-create the Markdown from the source.
> Please check with us if you plan to do this.

FAQ
---

*   *Where can I get help?*
    <br/>
    Mail us at [board@datacarpentry.org](mailto:board@datacarpentry.org),
    come chat with us on [our IRC channel](irc://moznet/sciencelab),
    
