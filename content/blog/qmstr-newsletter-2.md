+++
title = "Quartermaster prototype development update #2"
date = "2017-12-20T00:00:00+01:00"
tags = ["qmstr", "FOSS", "compliance", "Jenkins"]
categories = ["qmstr"]
banner = "img/blog/qmstr-newsletter-2-title.jpg"
+++

In the second Quartermaster prototype development sprint, we focused
on the connection between Continuous Integration and the build
instrumentation performed by
Quartermaster. [Jenkins](https://jenkins-ci.org/) serves as the
reference build system for the prototype. We wanted to lay the
foundation for executing Quartermaster instrumented builds from a CI
build queue, and creating a feedback loop to developers by feeding
FOSS compliance analysis results back into the build results page.

# Sprint #2: Initial integration between CI and Quartermaster

With the end of this sprint, we published an initial plugin to Jenkins
that communicates with the Quartermaster master process running
adjacent to the software build process. The master acts as an
intermediary that aggregates the project metadata, reports health and
progress information to the CI system, and answers requests for
reporting and analysis of the metadata.

## Progress: Integrate Quartermaster with Jenkins

Quartermaster implements a command line toolchain that aggregates
software metadata and performs FOSS compliance related analysis. The
toolchain can be used by developers from the command line. However it
is designed in a way that for the automation of tasks in development
infrastructure, especially CI. In the prototype, the Jenkins plugin
provides logic to start the Quartermaster master before the actual
software build, check it's health and progress while the build runs,
and then queries targets that where built and reports for these
targets after the build completes.

We use
the
[recommendations of the FSFE Reuse project](https://reuse.software/practices/2.0/) for
guidance as to which features to implement as a minimum set of
functionality that provides tangible value to FOSS communities and
businesses. The Jenkins plugins shows
a ["Reuse Compliant" badge](https://reuse.software/materials/) if the
build passes the checks. The actual checks performed are still being
implemented. It seems the Reuse project will release recommendations
for practises, but not tools to verify compliance with these
recommendations. This means we may have to develop the actual checks
ourselves, which is something we are looking into now.

## Questions, questions, questions

There are a couple of issues that (not entirely unexpectedly) became
apparent during development. Identifying these issues and
systematically developing good and reliable solutions to them is one
of the key reasons to build a prototype in the first place. The
experience from the development of the prototype will guide us when
designing the first production Quartermaster.

Code generators pose a difficulty in that we need a more or less
generic way to declare which input files (incuding their license and
authorship data) are used to generate source code. Source code
geenrators are rather common tools and can be instrumented just like
compilers and linkers. The Qt toolkit uses a number
of
[well-known code generators like `moc` or the user interface compiler](http://doc.qt.io/qt-5/why-moc.html). Sometimes,
software projects compile their own code generators during the
software build. Quartermaster needs to be able to detect the
relationship between the code generator input files and the generared
source code, and use that information to identify license and author
metadata.

Incremental builds may mean that only a part of the software project
under analysis may be compiled  during a single build run. This
happens for example when starting a make run after a previous build
was complete and only a single file was changed. The Quartermaster
prototype will expect that a fulll build is performed for the reports
to be complete. We may later define rules for the lifetime of the
master process so that incremental builds are supported.

Generating a feature rich user interface in CI systems will require
us to develop visualisations for metrics of different kind. This is
certainly doable, however it depends on the API provided by the host
CI system. Not all systems may support all reporting features offered
by Quartermaster.

The prototype data model is rather bare bones. It will serve us for
the implementation fo the prototype feature set. In the long run
however, we are considering using an in-memory graph database that
is able to store sturctured and less structured project metadata, and
allows reporters to perform queries of the project metadata. This will
become especially important once the compliance metadata of multiple
software bilds will be aggregated into a complete overview of a whole
system image or software distribution.

Identifying compliance input data for system dependencies will be
implemented using the `apt` package management  of the reference
system. This may require a knowledge base for software artifacts in
the long run, especially since the aim is to support other operating
systems than Linux.

## Upcoming work in sprint #3

Sprint #3 has now started. We aim to extend the implementation of the
Reuse guidelines, possibly by implementing multiple checks and result
metrics for the individual recommendations. We aim to generate the
recommended author and license information and the bill of materials,
add visualisations in Jenkisn for them, and -- if the project scores
well enough -- display a "Reuse compliant" badge.

We aim to move all analysis into the master process, and implement
identification of the declared author and the copyright holder using
the file content, `git blame`
and [cregit](https://github.com/cregit/cregit). We are beginning to
use the Github issue tracker in
the [Quartermaster prototype repository](https://github.com/QMSTR) -
feel free to submit feature requests or bug reports. Pull requests are
also welcome.

Because of the end-of-year holidays, sprint #3 is planned for 4 weeks
instead of 2. After that, we will return to our usual 2 weeks
rhythm. After the end of sprint #3, the version 0.1 requirements
definition workshop will take place January 17, 2018, from 10am to
5pm, at the Endocode office on Berlin. Remember to register for a
seat, and we hope to see you there. Happy holidays, merry christmas
and a happy new year!

### Credits
Title image: [Angela Mueller, "Macro Lens", CC BY 2.0](https://www.flickr.com/photos/22103696@N07/4591184598)

