+++
title = "Quartermaster Milestone 3 Development Report: C++, Linux, CCache"
date = "2019-02-03T00:00:00+01:00"
tags = ["qmstr", "FOSS", "compliance", "milestone", "report"]
categories = ["qmstr"]
banner = "img/blog/qmstr-ms-3-report-title.jpg"
+++

Version 0.3 of Quartermaster was tagged on February 1, 2019. It
includes improvements to allow for example the Linux kernel, glibc and
openssl as projects under analysis. It delivers support for snapshots
of the knowledge graph, which allows rolling back changes to a known
state, as well as support for source code in assembly language. It
improves the support for `ccache`, `ar`, `ld` and `objcopy`, and for
analyzing source code elements that are generated during the build and
are not part of the original source code package. Quartermaster is
Free and Open Source software and developed under a collaborative open
governance model. As usual, the source code is available on
[Github](https://github.com/QMSTR/qmstr/releases/tag/v0.3). Read more
for all the details on the new release.
<!--more-->

# Quartermaster Version 0.3

The new release marks one year of Quartermaster development. The
development team focused on covering complete use cases of real-life
Open Source projects like the Linux kernel, openssl or glibc. This
approach helped to identify gaps in Quartermaster functionality which
led, for example, to added functionality for `ld` and `objcopy` that
are used in the build system of these projects. One concern in such
scenarios is that code gets either generated or combined from other
elements in the source tree and then passed to the compiler via stdin,
without being saved to the file system. In such a case it is difficult
to identify what exact code is compiled and added to the resulting
binary. The code is now saved for later inspection.

Larger projects also take longer to compile, so we made sure to
improve the integration with ccache as a means to speed up
compilation. Scancode integration has been extended to integrate the
author information it produces into the knowledge graph. Work
continues on streamlining the graph model. Nodes are now typed to
provide a more structured approach in using the underlying DGraph
database. This effort will continue throughout the next release,
aiming for more streamlining of the data model that allows for more
generic approaches to reporting aggregated results. Support for the
C++ programming language was extended through deeper integration with
the compiler toolchain. A lot more work went into the 0.3 release that
is less visible to Quartermaster users, but hopefully contributes to
making the toolchain more complete and robust. Overall, we are
approaching a complete and stable toolchain with a defined standard
set of modules, which is the overarching goal for the upcoming 0.4
release.

## Building the wider Quartermaster ecosystem

The development team aims at tagging a milestone version for
Quartermaster roughly every 3 months. This one took 6 months to
finish. There are two good reasons for that: FASTEN, and ACT.

The [FASTEN](https://www.fasten-project.eu/) project is a [European
Commission H2020](https://ec.europa.eu/programmes/horizon2020/) funded
consortium that develops innovative ecosystem analysis techniques for
C/C++, Java and Python applications. [Endocode](https://endocode.com/)
is a member of the consortium and will work on further development of
Quartermaster as part of the project for the coming three years. Work
on the project began in January 2019 with a kick-off meeting at [TU
Delft](https://www.tudelft.nl/en/).

Endocode has aimed at developing Quartermaster under a neutral
umbrella organization from the start. With the upcoming launch of
[ACT](https://www.linuxfoundation.org/press-release/2018/12/the-linux-foundation-to-launch-new-tooling-project-to-improve-open-source-compliance/)
at the Linux Foundation, this long-term goal finally comes to
fruition. Quartermaster will be incubated at ACT.

Combined, FASTEN and ACT mean that Quartermaster now has evolved from
an initiative of Endocode into being a part of a larger research and
development consortium as well as being hosted at a major Open Source
foundation. This gives the development team the opportunity and the
stability to grow and to continue our work for the coming three
years. We are very excited and proud of this overall development (and,
frankly, happy to go back to coding after spending much time on
proposal writing, financial planning and all the formalities
involved).

## What is next in a future 0.4?

The next milestone release of Quartermaster is roughly planned for
mid-April 2019. To prepare for the launch of ACT and to align with the
roadmap for FASTEN, the development team aims to wrap up a complete
and stable toolchain with a defined default set of build, analysis and
reporting modules. This will serve as the foundation for future
expansion of the core toolchain functionality and the addition of
modules against a stable API.

A missing piece in the knowledge graph currently is information about
how the software is being packaged for distribution after the
build. For the next release, one goal is to integrate packaging
information into the knowledge graph. Packaging is unfortunately less
standardized than the build process, so it may need more than one
milestone release to provide complete and stable functionality for it.

Another focus will be stability and completeness of the essential
toolchain functionality, with the aim to prepare for future additions
of new functionality. This will require a review and possible
refactoring of the knowledge graph model, as well as structuring the
way metadata is stored in the graph and exchanged between the analysis
and reporting modules.

### Open Governance

Everybody interested in Quartermaster is invited to join the public
sprint reviews and milestone requirements workshops (there is however
limited capacity for the workshops, so make sure to register early!)
The project applies an open, meritocratic governance model: our code
and the roadmap including tickets are on Github, and there is an open
Slack workspace that everybody is invited to join. In general, all
aspects of the project are open for collaboration -- it is truly Open
Source.

### Commercial support

Every Open Source product intended for use in commercial environments
needs professional services. Quartermaster separates strictly between
the Open Source product, and professional services that enable
businesses to learn, adopt and deploy Quartermaster.

Since the release of version 0.1, [Endocode](https://endocode.com/)
offers support contracts, training, custom development and consulting
in the form of [professional services
packages](https://endocode.com/qmstr/) for Quartermaster. We hope that
with the further success of the project, more Open Source minded
businesses will begin offering professional services and help making
Quartermaster the default toolchain for FOSS compliance documentation.

## Thank You Notes

Quartermaster is a community project, and would not have been possible
without the help of some key supporters for which we are deeply grateful.
We would like to especially thank Siemens for supporting the work
on full support for building Linux, openssl and glibc. We are thankful
to the sponsoring and guidance provided by our other supporters and
especially to all of you who advocated for Quartermaster to become a
Linux Foundation project and long-term funded. We did it!

Title image: Mirko Boehm, "CopyleftConf 2019", CC BY 2.0 - Open Source
license compliance was an important topic at the first [Copyleft
Conference](https://2019.copyleftconf.org/) held right after
FOSDEM. The photo was taken during the opening session.



