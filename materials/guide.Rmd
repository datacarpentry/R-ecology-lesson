This lesson is written as an introduction to R,
but its real purpose is to introduce the single most important idea in programming:
how to solve problems by building functions,
each of which can fit in a programmer's working memory.
In order to teach that,
we must teach people a little about
the mechanics of manipulating data with lists and file I/O
so that their functions can do things they actually care about.
Our teaching order tries to show practical uses of every idea as soon as it is introduced;
instructors should resist the temptation to explain
the "other 90%" of the language
as well.

The secondary goal of this lesson is to give them a usable mental model of how programs run
(what computer science educators call a [notional machine](../../gloss.html#notional-machine)
so that they can debug things when they go wrong.
In particular,
they must understand how function call stacks work.

The final example asks them to build a command-line tool
that works with the Unix pipe-and-filter model.
We do this because it is a useful skill
and because it helps learners see that the software they use isn't magical.
Tools like `grep` might be more sophisticated than
the programs our learners can write at this point in their careers,
but it's crucial they realize this is a difference of scale rather than kind.

## Teaching Notes

*   Watching the instructor grow programs step by step
    is as helpful to learners as anything to do with Python.
    Resist the urge to update a single cell repeatedly
    (which is what you'd probably do in real life).
    Instead,
    clone the previous cell and write the update in the new copy
    so that learners have a complete record of how the program grew.
    Once you've done this,
    you can say,
    "Now why don't we just breaks things into small functions right from the start?"

*   The discussion of command-line scripts
    assumes that students understand standard I/O and building filters,
    which are covered in the lesson on the shell.
