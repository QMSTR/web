+++
title = "Quartermaster Sprint 4.3 Development Report: Documentation, documentation, documentation"
date = "2019-04-02T08:00:00+01:00"
tags = ["qmstr", "FOSS", "compliance", "sprint", "report"]
categories = ["qmstr"]
banner = "img/blog/qmstr-sprint-4.3-title.jpg"
+++

The QMSTR sprint 4.2 and 4.3 (this report covers both) are part of our
current efforts to merge the ongoing QMSTR development and the FASTEN
project. A key necessity for this was documentation. Everybody loves
to write documentation, especially developers. Right? :-) To make it
even more fun, we work on integrating end user and administrator
documentation with the project code and perform automated integration
test automatically. We hope that this approach may lead to
documentation that works and is reliable. Even though this effort is
still ongoing, some results are already visible, like the new project
documentation on the main web site. Some feature development primarily
on the node management command line interface is also in progress and
should be finished for the QMSTR 0.4 release, planned for April 17.
<!--more-->

# Quartermaster Sprints 4.2 and 4.3

The documentation for QMSTR started as a couple of Markdown files in
the doc/ subdirectory in the main repository. We have extended this
approach so that the documentation stays in the repository, which
facilitates automated testing, and is used to generate and publish web
pages from it. [These pages are now
available](https://qmstr.org/documentation/) on the QMSTR web site and
updated when a PR is merged. They are partly auto-tested using
[shelldoc](https://github.com/endocode/shelldoc). Work is ongoing to
extend test coverage and to set up test harnesses that model different
scenarios, like executing a documentation page against a QMSTR master
in analysis mode. Once this setup is operational, the team aims to use
documentation based integration tests as an approval model for pull
requests.

## Work in progress

Work continues on the node management command line interface to the
knowledge graph. The overall goal is to provide all functionality to
manage the knowledge graph from the command line, scripts or build
system modules. The elemental operations for that are those to create,
display, update and delete nodes, plus operations to connect and
disconnect nodes. We have added a [scheme to reference
nodes](https://qmstr.org/documentation/qmstr-basics/qmstr-cli/database_cmds/)
based on node type, attribute and value to facilitate this. This
functionality should be ready for the QMSTR 0.4 release. Some of it is
already beginning to be reflected in the new documentation
pages. Other 0.4 release preparations include updates to the knowledge
graph scheme, especially the introduction of the project node. An
important bug fix is the [prevention of recursive invocations of the
compiler/linker wrappers](https://github.com/QMSTR/qmstr-all/issues/186).

## Next chances to participate

Sprint 4.4 is the last sprint for the 0.4 milestone and is now in
progress. It will end on April 17 with the usual open demo and sprint
review, to which you are cordially invited :-) The sprint demo is
scheduled for April 17 at 4pm CET. Use [this
link](https://meet.jit.si/Quartermaster) to join the meeting.

Title image: Fondo Antiguo de la Biblioteca de la Universidad de
Sevilla, "Breve descripcion del mundo y sus partes ò Guia geographica
y hydrographica", Public Domain. We think it nicely illustrates the
importance of documentation.
