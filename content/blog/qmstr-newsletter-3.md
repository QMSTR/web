+++
title = "Quartermaster prototype development update #3"
date = "2018-01-29T00:00:00+01:00"
tags = ["qmstr", "FOSS", "compliance", "cmake"]
categories = ["qmstr"]
banner = "img/blog/qmstr-newsletter-3-title.jpg"
+++

The third Quartermaster prototype development sprint also marked the
end of development of the Quartermaster prototype. Our main goals for
the prototype was to work with our partners and collaborators to
develop an approach to FOSS compliance automation that delivers
correct and complete results in a variety of use cases. The
integration of new build systems has been tested, the workflow phases
have been refined and abstracted further and limits of the prototype
design identified. We wrapped up the sprint with a workshop where the
functionality of the prototype was evaluated and the findings applied
to a draft architecture of the first production release of
Quartermaster.

# Sprint #3: cmake, curl, more Jenkins, Go

In terms of feature development, sprint #3 was a wild ride. We
extended the build tracing toolchain to support the rather popular
`cmake` build system. This allowed us to set up a demo of an
instrumented build of the version of `curl` that was modified as part
of the [Reuse initiative](https://reuse.software) to contain license
identifiers across the board. We worked further on the concept of
implementing web based feedback visualisations that support feedback
formats like warnings and binary or coefficient type metrics. It
will serve as a foundation for future integration features into CI and
repository hosting systems. Finally, we investigated how to instrument
the [Go language](https://golang.org) build system and showed that
build tracing works as needed. While not all these efforts directly
led to glossy features in the prototype, they are the basis for
production features in Quartermaster. Overall, we have achieved the
goals set for the development of the prototype, and are now
transitioning into product developing.

## Towards an architecture vision for a FOSS compliance toolchain

You may ask: "Why develop a prototype just to throw it away?" A good
question. We made the plan to go from proof of concept to prototype to
product, and stuck to it. The first implementation is never good
enough, and naturally some key implementation details only emerged as
we went. The software world is full of crappy first drafts that
dragged the legacy of a bad architecture into the later product. This
is something we wanted to avoid.

The first sprint in the new cycle will be used to create the rigging
for the new toolchain architecture. The hand-made crude data model
used in the prototype will be replaced by a graph database. This will
not only provide query capabilities that will be useful for analysis
and reports. It also lays the foundation for "the aggregator", the
unit-of-distribution level tool that will collect the knowledge
gathered about the individual package builds, and will then create
aggregate reports about the distributed product, like an app store
program or a firmware image. We decided the Quartermaster master
process will _always_ run in a Linux container, even if the host
system is macOS or Window. Container runtimes exist on all relevant
platforms. This way, we will be able to deliver one "authoritative"
container image that will run the master, and issues like how to
configure analysis tools or how to run the graph database will be
implementation details users will not have to care
about. [gRPC](https://grpc.io) will be used to implement the
communication between the Quartermaster toolchain components, because
it is fast, and there are interface compilers for all relevant
languages. This will make integrations easier to implement, and reduce
the dependency on a specific implementation language in the tool
chain. Did anybody say microservice?

## Next steps: version 0.1! tests! demos! sweat and tears!

We will now reset the sprint count and start with sprint #1 of the
first Quartermaster version. The new beginning involves setting up new
repositories. The core tool chain, the Jenkins integration and the
automatic demo/test cases will be split up. The master graph database
and communication stubs will be added, and the reusable code from the
prototype reviewed and imported so that we get back to a working
system as fast as possible. The existing demo cases will be moved into
an automated setup and converted to integration tests that also serve
as demos. Demo builds for more projects will be added to this setup as
we go.

The next [Quartermaster community
hangout](https://meet.google.com/mdq-dkcv-pef) is planned for January 31,
16:00 CET. This is where the upcoming sprint goals will be
discussed. Feel free to join. We are interested in your feedback, and
in suggestions for what to focus on in the development sprints.

### Credits
Title image: [Michael Coghlan, "Basic Beginnings", CC BY-SA 2.0](https://www.flickr.com/photos/mikecogh/11593820664) Thanks for sharing!

