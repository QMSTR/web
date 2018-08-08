+++
title = "Quartermaster Milestone 2 Development Report: Python client modules, SPDX, more automation"
date = "2018-08-08T00:00:00+01:00"
tags = ["qmstr", "FOSS", "compliance", "milestone", "report"]
categories = ["qmstr"]
banner = "img/blog/qmstr-ms-2-report-title.jpg"
+++

After another quarter of intense software development, We are proud to
announce the availablility of Quartermaster v0.2. Quartermaster is a
toolchain that automates the analysis and documentation of Open Source
license compliance. Software vendors - businesses as well as Open
Source communities - deploy Quartermaster in their build pipelines to
create compliance documentation while software package sare being
created. With the new version, Quartermaster learns to ingest SPDX
formatted source code manifests, adds a client library for developing
analyzer or reporter modules in the Python programming
language, adds support for running multiple build processes on the
same hardware concurrently, and much more. Quartermaster is Free and
Open Source software and developed under a collaborative open
governance model. Get the [source code from Github while it is
hot](https://github.com/QMSTR/qmstr/releases/tag/v0.2)! Read more for
all the details on the new release.
<!--more-->

# Quartermaster Version 0.2

As announced in an earlier blog post, a milestone version for
Quartermaster will be tagged roughly evey 3 months. Quartermaster as a
product is now 6 months old, and we believe that productive use cases
are now becomong a reality. A [new
tutorial](https://github.com/QMSTR/qmstr/blob/master/doc/Getting-Started.md)
illustrates the philosophy and basic use of the Quartermaster
toolchain. The build system has been updated to simplify the
installation of the client and master side tools. An updated client
side control tool (`qmstrctl`) is used to
interact with the master. Based on the functionality provided with
this release, the team will focus on implementing a number of
real-life use cases that will be published on the project web site and
serves as references on how to use the toolchain.

## Key features

A few new concepts have been introduced that add important
functionality to the modules executed in the context of the
master. All modules are now pre-configured with a cache and an output
directory. The master instances are ephemeral, there is no
long-running services as part of a Quartermaster setup. The cache
location allows modules to persist information that may then be
accessed in subsequent builds. This way modules can, for example,
trigger alerts or notifications if metrics change, or compare
analysis results to a baseline. The cached information is not directly
useful to the user, however it may greatly improve the value of the
generated reports. The module output directory bridges the master
context and the build directory. All data generated in the output
directories of the reporters will be made available in the build
directory when the master quits or when executing a special copy
operation. This feature provides an easy way, for example, to add
generated reports to packages during a following installation step.

Trust levels and confidence levels are concepts that have been added
to analysis modules. The philosophy of Quartermaster is to provide the
glue code between all the existing tools for license and contributor
analysis and other compliance metadata, even if they provide
overlapping or conflicting information. By assiging different trust
levels to, for example, two license scanning tools, the user
configures which results should be considered. The module with the
higher trust level will "trump" the results provide by the less
trusted module. In a real life scenario, compliance information
provided by a knowledge base curated by reviewers can be configured to
overwrite results detected by license scanners. Trust levels are
configured per analyzer module in the `qmstr.yaml` configuration
file. Confidence levels come into play of two modules with the same
trust levels (two license scanners, for example) provide
results. Confidence levels are provided by the analysis tools, as
opposed to being configured by the user. They are a way for tools to
express how certain they are about the results, and help the reporters
to select which information to prefer.

The `qmstrctl` tool has been refactored from what was previously
known as ~~`qmstr-cli`~~ and provides functions for the client side to
control and interact with the master. In fact, as the tutorial is
showing, it now starts and quits the master as well. Other functions
include triggering the analysis and reporting phases, querying the
master Log output and copying the output data to the client side. In
the process, the ports and container names have been abstracted so
that multiple masters running on the same host do not interfere with
eah other. All tools now use a consistent pflag-based command line
interface. Client tools can use a subscription mechanism to listen to
master events.


The updated make-based build system provides targets to create the
master images, modules and install the client side tool. While the
core parts of Quartermaster are written in the Go programming
language, the releaae also contains Python code and various analysis
and reporting tools that are packaged into the master images. The
build system provides a single entry point into all the setup
tasks. See the [installation
instructions](https://github.com/QMSTR/qmstr/blob/master/doc/Installation.md)
for details. This enabled the addition of a Python client library for
developing Quartermaster modules, as well as the implementation of a
SPDX analyzer that processes source code package manifests in SPDX
format. A first version of a standardized bill of materials report was
added to the API and implemented in the HTML reporter. The HTML
reporter now generates more detailed bills of material for the project
under analysis, and is able to aggregate the documentation generated
in subsequent runs (this requires setting up a persistent cache
volume, see above).

For developers, functionality was added to execute modules containing
test cases in the analysis and reporting phases, and support for
debugging the master was improved. Besides that, a lot of clean up,
refactoring and polishing was performed on the code base. We are
beginning to add more and more user facing documentation that is
automatically tested using the
[shelldoc](https://github.com/endocode/shelldoc) tool. The
documentation test results are [reported by CI to the main
Quartermaster
repository](https://github.com/QMSTR/qmstr#continuous-integration-status).

## Development workflow, governance and commercial support

The Quartermaster project publishes a timed _milestone_ release every
quarter. At the beginning of each milestone, a workshop will be held
to identify and prioritize the requirements for the upcoming version,
and to break them down into tasks for the development sprints. The
workshop for the v0.3 release planned for mid-October 2018 was held on
July 18 at the Endocode office in Berlin. The v0.4 requirements
workshop is planned close to the [Open Source Summit Europe
](https://events.linuxfoundation.org/events/open-source-summit-europe-2018/).

Every milestone consists of 6 sprints of two weeks each. At the end of
every sprint, a public video conference will be held where the sprint
results are demonstrated, and the next sprint is planned in
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

## The road to version 0.3: How to participate and how to help

We set up a new [project
board](https://github.com/orgs/QMSTR/projects/1) that provides an
ovderview of the progress of the ongoing work across all the
repositories of the project. Issues may be reported against any of the
active Quartermaster repositories.

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

## Thank You Notes

Quartermaster is a community project, and would not have been possible
without the help of some key supporters that we are deeply grateful
to. We are thankful to the sponsoring and guidance provided by Siemens
and Google, and the ongoing support of the Linux Foundation. We also
thank the companies that support the project through proof-of-concept
installations and testing. With your ongoing help, we are on course
for the v0.3 release in October.

Title image: Mirko Boehm, "BBQ", CC BY 2.0

