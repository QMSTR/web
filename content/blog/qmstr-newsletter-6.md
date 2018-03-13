+++
title = "Quartermaster v0.1 development update #3: It works - now make it easier"
date = "2018-03-13T00:00:00+01:00"
tags = ["qmstr", "FOSS", "compliance", "LFOSLS"]
categories = ["qmstr"]
banner = "img/blog/qmstr-newsletter-6-title.jpg"
+++

In sprint #3 towards Quartermaster v0.1, we made it easer to package
the master into a Docker container using a multi-stage Docker file,
merged the `qmstr-container` repository into the `qmstr` one, set up
more CI to endure quality of the master HEAD and the incoming PRs,
extended license detection with ScanCode and Ninka, and began
implementing the reporting API endpoint. You can now see the build and
test results both for incoming PRs as well as for the master mainline
branch. Finally we prepared Quartermaster to be presented at the Open
Source Leadership Summit. We made good progress, even though the setup
is still a bit rough at the edges. It works, but the APIs are not yet
as modular as we want them to be. We will focus on that in the next
sprint.
<!--more-->

# Build, analyzers and reporters are there, but need to be refactored

We finished implementing the modules that extend the build graph with
author and license information using Ninka and ScanCode. The modules
run in the Analysis phases, which is triggered by `qmstr-cli`. They
are, however, still performed in-process with the master. This
violates our concept that the modules should not become derivative
works of the master, so that module vendors are free to choose
licenses for their modules that fit their needs. The analysis modules
need to be refactored so that they run as separate processes executed
by the master.

{{< figure src="/img/blog/OSLS-QMSTR-Presentation.011.png" alt="QMSTR Workflow Phases and Tasks" width="100%" >}}

The architecture overview for Quartermaster illustrates the concepts
of phases and functions that are key to the design. During the
_Construction_ phase, the build graph and the necessary project
metadata is aggregated in the data model. Once the build is complete,
the _Analysis_ phase kicks off, during which the build graph
represented in the data model is augmented with author, copyright
holder and license information. The data model is technically capable
to aggregate all kinds of software metadata like quality metrics or
security alerts. However we have decided for the moment to focus on
automating FOSS license compliance aspects. We may go back to other
ideas at a later point in time. The _Reporting_ phase them performs
modules that trigger actions based on the data model - generating HTML
reports, for example, but also sending notifications, or uploading
results to knowledge bases.

The key difference between the analysis and reporting phases is that
during the reporting phase, the data model has become
immutable. Reporters can evaluate and format the results, but they
cannot change them anymore. There is no direct connection between
analysers and reporters. All communication between them must be done
through the data model. This way, both free and proprietary tools can
hook into the Quartermaster workflow. All aggregated data however will
be kept in an openly licensed data model.

The blue modules in the graphic show modules that (at least according
to current plans) will be shipped with Quartermaster. The green ones
also come with it, however their key functionality is provided by
existing external tools - license scanners, author identifiers, et
cetera. The grey ones could be custom modules configured by the
user. The yellow ones point to interactions with external knowledge
bases that could for example provide and collect metadata about
dependencies.

## Plans for the upcoming sprint

The modular concept now works in the different phases. In the next
sprint, we will move the design closer to the intended one where all
modules - built-ins or custom ones - are executed in a separate
process by the master. For this we need to refactor and stabilise the
phase specific APIs, and modularise the current tooling. The data
model also needs to be extended so that multiple tools of the same
type - license scanners, for example - may run in parallel without
overwriting their results. We plan to implement an initial HTML
reporter, and to create samples for simple analysis and reporting
plugins that showcase how Quartermaster's built-in workflows can be
extended for specific use cases.

And we are going to present our current state of development at the
Linux Foudation's open Source Leadership Summit in Sonoma. This will
be the first time our project is presented to a industry-wide
audience. We are quite excited :-) 

## How to participate

During the next sprint, Quartermaster will be presented at
the
[Open Source Leadership Summit](https://events.linuxfoundation.org/events/open-source-leadership-summit-2018/program/schedule/) in
Sonoma Valley, CA.

Next, there will be a talk on Quartermaster at
the [BCS Open Source Specialist Group](http://ossg.bcs.org/) hosted
event
on
[Yanking the Chain: Open Source Software Compliance in the Supply Chain](http://ossg.bcs.org/blog/2018/02/15/yanking-the-chain-open-source-software-compliance-in-the-supply-chain-london-22-3-2018/) on
March 22 in London.

The next [community hangout](https://meet.google.com/mqr-sqwi-cxn) is
scheduled for March 15, 2018, at 16:00 CET. Feel free to join us!

### Credits
This time, all illustrations are our own.
