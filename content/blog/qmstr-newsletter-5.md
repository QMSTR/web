+++
title = "Quartermaster v0.1 development update #2: Key building blocks are falling into place"
date = "2018-02-23T00:00:00+01:00"
tags = ["qmstr", "FOSS", "compliance", "Github", "CI", "Ninka", "Scancode"]
categories = ["qmstr"]
banner = "img/blog/qmstr-newsletter-5-title.png"
+++

It feels great when a plan comes together. After the requirements
workshop on January 17, the Quartermaster team had a pretty good
understanding of what the architecture of the toolchain should look
like. Two weeks into development, we now see that the design is solid,
and that the runtime phases and modular analysis and reporting
concepts work well. The details of the architecture will be explained
in an upcoming blog post. Right now, we are making good progress
towards a working system. The `curl` demo was extended, we added the
`qmstr-cli` tool to manage the master, and set up the first internal
CI.
<!--more-->

# Key building blocks are falling into place

The first CI build job was set up to automatically build and test
incoming pull requests to the [master](https://github.com/QMSTR/qmstr)
repository. It reports CI results for the pull requests before
they are merged.

The `qmstr-cli` tool can now be used to interact with the master. It
offers basic operations like triggering analysis or reporting, or to
quit the master process. Developers that run the Quartermaster
toolchain locally will use it from their command line.

The build graph that is created during the build phase is now
available to analysis and reporting tools. Analysers operate on the
graph and augment the graph data with their results. There is no
direct connection between analysers and reporters. This concept
faciliates the integration of a variety of tools based on a freely
licensed data model.

We are introducing a Quartermaster configuration file usually to be
committed into the repository of the product under analysis. It
configures parameters like which analysis or reporting tools to run
and where to report to, but also attributes like the declared license
under which a target will be distributed.

## Plans for the upcoming sprint

In the next sprint, we plan to implement the modules that integrate
Ninka and Scancode for license and copyright analysis. This means
extending the analysis and reporting endpoints of the master API, and
implementing the tool adapters in the master. We will add a draft for
the instrumentation of `install` operations that will provide us with
information about what linked targets actually make it into, for
example, a firmware image. We plan to refactor the Dockerfile to make
it easier to create development and production setups of the
Quartermaster master. And we will extend our build infrastructure to
report CI results for building and testing the master
to [Github](https://github.com/QMSTR/qmstr).

## How to participate

Quartermaster will be presented at
the [BCS Open Source Specialist Group](http://ossg.bcs.org/) hosted
event
on
[Yanking the Chain: Open Source Software Compliance in the Supply Chain](http://ossg.bcs.org/blog/2018/02/15/yanking-the-chain-open-source-software-compliance-in-the-supply-chain-london-22-3-2018/) on
March 22 in London.

In case you are attending the
upcoming
[Open Source Leadership Summit](https://events.linuxfoundation.org/events/open-source-leadership-summit-2018/program/schedule/) in
Sonoma Valley, CA, [Mirko Boehm](https://www.linkedin.com/in/mirkoboehm) will present and
demonstrate an introduction to Quartermaster there.

The next [community hangout](https://meet.google.com/mqr-sqwi-cxn) is
scheduled for February 28, 2018, at 16:00 CET. Feel free to join us!





### Credits
Title image: [Sheila Sund, "Color block living", CC BY 2.0](https://www.flickr.com/photos/sheila_sund/24155743389) Thanks for sharing!
