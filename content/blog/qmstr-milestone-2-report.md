+++
title = "Quartermaster Milestone 2 Development Report: "
date = "2018-08-08T00:00:00+01:00"
tags = ["qmstr", "FOSS", "compliance", "milestone", "report"]
categories = ["qmstr"]
banner = "img/blog/qmstr-ms-2-report-title.jpg"
+++

We are proud to announce the availablility of Quartermaster v0.2. 

...

standard query logic for highest trusted/best confidence result

Get it while it is hot!
<!--more-->

# Quartermaster Version 0.2

As announced in an earlier blog post, a milestone version for
Quartermaster will be tagged roughly evey 3 months.  

It is literally
Quartermaster's first birthday. The project was incepted at the [Legal
and Licensing Workshop
2017](https://fsfe.org/news/2017/news-20170619-01.en.html) that
started on April 25, 2017 -- exactly one year ago. The project had a
great if turbulent first year, and now we are admiring our first
version and say "Geez, this is one cute baby!" Come have a peek into
the crib:

## Key features

Concepts:
* output dir
* cache dir

Sprint 2.2:
* Python client library
* SPDX analyzer that reads SPDX input data from package manifests
* infrastructure for integration tests (run analyzers and reporters
  that are in fact test cases)

Sprint 2.3:
* decouple builds on same machine (ports, container names, ...)
* qmstr-cli is now qmstrctl
* qmstrctl is now used to start, stop the master and control its phases

Sprint 2.4:
* path substitution between the bui8ld and the master paths does not
  need to be specified in the qmstr.yaml file anymore
* trust levels
* all tools now use pflag consistently
* subscription logic for master events - user can see progress and
  errors on the master side

Sprint 2.5:
* SPDX package metadata analyzer module
* standardized bill-of-materials report
* HTML reporter logic finished

Sprint 2.6:
* BOM report
* cleanup, polishing
* tutorials
* release

## Development workflow, governance and commercial support

This report wraps up the first milestone of Quartermaster. This will
now become the rhythm of the project: Every quarter marks a timed
milestone release. At the beginning of each milestone, a workshop will
be held to identify and prioritize the requirements for the upcoming
version, and to break them down into tasks for the development
sprints. Every milestone consists of 6 sprints of two weeks each. At
the end of every sprint, a public video conference will be held where
the sprint results are demonstrated, and the next sprint is planned in
detail.

### Open Governance

Everybody interested in Quartermaster is invited to join the public
sprint reviews and milestone requirements workshops (there is however
limited capacity for the workshops, so make sure to register early!)
The project applies an open, meritocratic governance model: our code
and the roadmap including tickets are on Github, and there is an open
Slack workspace that everybody is invited to join. In general, all
aspects of the project are open for collaboration -- it is truly Open
Source.

### Have some standards, please...

There are some norms though that the project applies: everything
developed as part of Quartermaster is fully and
completely
[Free and Open Source software](https://fsfe.org/about/basics/freesoftware.en.html). "Open
core" models that hold back crucial functionality for an "enterprise
version" are _not accepted_. Since the project applies a reciprocal
license to it's own code, it requires no contributor
license agreement. All contributors keep the rights to their
contributions. Most importantly, all knowledge generated and
aggregated in the toolchain has to be submitted to the master data
model under an _open data license_. Hoovering up FOSS compliance data
to build a proprietary knowledge base is also _not accepted_ without
giving the same data back into the compliance knowledge graph
maintained by Quartermaster, since we
believe that this is, in fact, a part of the problem in the FOSS
compliance space that we are trying to fix.

### Commercial support

Every Open Source product intended for use in commercial environments
needs professional services. Quartermaster separates strictly between
the Open Source product, and professional services that enable
businesses to learn, adopt and deploy Quartermaster.

With the release of version 0.1, [Endocode](https://endocode.com/)
begins to offer support contracts, training, custom development and
consulting in the form
of [professional services packages](https://endocode.com/qmstr/) for
Quartermaster. We hope that with the further success of the project,
more Open Source minded businesses will begin offering professional
services and help making Quartermaster the default toolchain for FOSS
compliance documentation.

## Development updates

* new project board: https://github.com/orgs/QMSTR/projects/1
* based  on that, tickets are  now managed in the  repository they are
  relevant for (qmstr, demos, ...)
* new instructions for debugging the master, ...: https://github.com/QMSTR/qmstr/blob/master/doc/Developers.md

## The road to version 0.3


## How to participate and how to help

Quartermaster is currently being developed mainly by Endocode with the
support of Siemens, Google and the Linux Foundation. Since the project
is completely Open Source, it needs your support. Any help is welcome:
We appreciate your code contributions, your feedback and your domain
knowledge. Enterprises that plan on using Quartermaster should
consider financially supporting the project through a grant. Grants
can be handled with the help of Linux Foundation or directly to the
project. All grants will be invested into contributions to the
project. Please [contact the project](/contact/) if you are able to provide
financial support or for any other inquiries.

The
next
[Quartermaster community hangout will take place on April 25, 2018 at 4pm CEST](https://meet.google.com/mqr-sqwi-cxn). Feel
free to join.

We are considering organising a Quartermaster hackfest, potentially
colocated with a major Open Source conference. If you are interested
in attending, hosting or sponsoring such a hackfest, please let us
know so that can start making plans.

## Thank You Notes

Quartermaster is a community project, and would not have been possible
without the help of some key supporters that we are deeply grateful
to:

- Siemens and Google, for providing guidance with domain knowledge, setting
  requirements and financial support,
- the Linux Foundation, for helping to establish the project and
  creating connections, presentation opportunities and for
  administrative support in handling grants to the project.

Thank you very much for all your help, without you this first release
would not have been possible! We are looking forward to celebrating
many more releases like this one!

Title image: Mirko Boehm, "BBQ", CC BY 2.0

