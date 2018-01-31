+++
title = "Quartermaster v0.1 development update #1"
date = "2018-02-13T00:00:00+01:00"
tags = ["qmstr", "FOSS", "compliance", "dgraph", "gRPC"]
categories = ["qmstr"]
banner = "img/blog/qmstr-newsletter-4-title.png"
+++

We hope you ready for some fireworks as we kick of the development of
the first Quartermaster version that aims for general
availability. The goal for this sprint, after we wrapped up prototype
development in the previous one, was to establish all the building
blocks that will make the Quartermaster toolchain. They are based on the
new system architecture developed at the requirements workshop on
January 17, and based (but developed from scratch) on the learnings
from the prototype. At the end of the sprint, we had a working
Quartermaster again, with some fancy graph visualisations.
<!--more-->

## Back to basics

The
old [prototype repository](https://github.com/QMSTR/qmstr-prototype)
is now retired, and
a [new repository structure](https://github.com/QMSTR/qmstr-all) was
set up. It uses Git submodules as we have the requirement to manage
versions across multiple repositories. `qmstr-all` is the main
repository. The `qmstr` repository contains the core toolchain, the
master process and the instrumentation client.

The Quartermaster components now communicate via gRPC. The master
process runs in a container, and runs a [dgraph](https://dgraph.io/)
instance used to model the collected metadata. Basic queries on the
database are already possible, and start to show some interesting
results. It is possible to query all linked targets, or all source
files, which is nice. More interestingly, it is possible to query a
subtree for a specific linked target that contains the information
about the actual source files and dependencies. We are getting
there. Compiler instrumentation and parsing was re-implemented, for
example to cover numerous corner for example found in the build of the
Linux kernel. There are probably many more of those. We are currently
testing on Linux and macOS. Support for the Visual Studio line of
compilers is on the horizon, but not yet in scope.

## Fancy graphs

We continue to use [Curl](https://curl.haxx.se) and especially the
[Reuse compliant branch of
it](http://blog.jonasoberg.net/a-reuse-compliant-curl/) as a
benchmark, and made a demo setup for it. This is a visualization
of the build graph as it is put together in the Quartermaster graph
database. The yellow nows are source files, the blue notes are linked
targets, and the hard to see red nodes contain license information.

{{< figure src="/img/blog/qmstr-newsletter-4-screenshot.png" title="A QMSTR build graph of Curl">}}

## Next steps for the upcoming sprint

So the new architecture is coming along nicely, but there is still a
long way to go. The skeletons of all the main components under the new
architecture are there and working. The next steps are to augment the
data model with copyright and license data, add the API endpoints for
analysis and reporting, extend project structure to be "go get"-table,
and to set up CI. By the end of sprint 2, we would like to have a
complete metadata graph of the instrumented project that is ready for
creating accurate reports.

The next [community hangout](https://meet.google.com/mqr-sqwi-cxn) is
scheduled for February 14, 2018, at 16:00 CET. Feel free to join us!

### Credits
Title image: [Merritt Boyd, "Fireworks", CC BY-SA 2.0](https://www.flickr.com/photos/chaos08/4765138953) Thanks for sharing!
