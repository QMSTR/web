+++
title = "Quartermaster Sprint 4.1 Development Report: Go, Java and Python integration libraries"
date = "2019-02-20T08:00:00+01:00"
tags = ["qmstr", "FOSS", "compliance", "sprint", "report"]
categories = ["qmstr"]
banner = "img/blog/qmstr-sprint-4.1-title.jpg"
+++

The key goal of QMSTR milestone 4 is to stabilize the APIs and
streamline the documentation and tutorials to prepare the integration
with the development work that takes part in
the [FASTEN project](https://www.fasten-project.eu/) and
in
[ACT](https://www.linuxfoundation.org/press-release/2018/12/the-linux-foundation-to-launch-new-tooling-project-to-improve-open-source-compliance/). To
prepare for that, sprint 4.1 focused on refactoring the integration
libraries for Go, Java and Python that developers use to
create [QMSTR](https://github.com/QMSTR) modules and client side
tools. These libraries help users to create diverse sets of modules
and client side code to fit their needs, and facilitate the
integration with various services like CI/CD environments.

<!--more-->

# Quartermaster Sprint 4.1

A QMSTR sprint spans two weeks. Starting with milestone 4, sprints
begin on Wednesdays and end on Tuesdays. The development work is
hosted at the QMSTR Github organization. You can follow the progress
of the ongoing sprint for example by looking at
the [project board](https://github.com/orgs/QMSTR/projects/1).

## About modules and clients for QMSTR

Users can integrate with QMSTR either by writing modules or from
client side code. Modules are usually analyzers or reporters. They are
individual programs that are running in the context of the master and
communicate with the master locally. Client side software can either
be command line tools that are integrated for example with build
systems, or code running in services like CI systems.

Both modules and clients talk to the master
using [gRPC](https://grpc.io/) and can therefore be implemented in
languages with gRPC support. The libraries implement common
functionality that make it easier for implementers and focus on Java,
Go and Python.

Both for module and client side programmers it is important to
understand the licensing perspective of QMSTR: Modules and clients are
separate binaries, and the QMSTR code these binaries use comes under
the terms of the LGPL. This means module and client authors choose their own
licenses freely to create free or proprietary modules and clients.

## Repository organization

The implementation of the master tools, the client side toolchain and
the integration libraries is provided in a number of Git repositories
under the [QMSTR Github organization](https://github.com/QMSTR). We
are currently thinking about the best organization for this,
especially with regard to integration testing between, say, Python
clients and the master API. Your input on this would be welcome. Any
possible code reorganization should be completed with the 0.4 release.

## Outlook to sprint 4.2

The next sprint starts today and will focus on
providing a complete command line interface for managing the build
graph in the master knowledge base. Users will be able to create,
update and delete nodes in the build graph and to connect and
disconnect them from the command line. This amounts to a major
refactoring of the build phase graph structure. We will also finish
the `qmstrctl describe` command which provides functionality to
inspect the knowledge graph client-side.

## Next chances to participate

Sprint 4.2 is now in progress. It will end on March 5 with the usual
open demo and sprint review, to which you are cordially invited :-) To
make it easier to join the meeting, we are trying Jitsi as it requires
no further software installation. The sprint demo is scheduled for
March 5 at 4pm CET. Use [this link](https://meet.jit.si/Quartermaster)
to join the meeting.

Title image: Mirko Boehm, "Lemon tart", CC BY 2.0 - I think it nicely
represents how diversity can be beautiful.
