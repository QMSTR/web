+++
title = "Quartermaster v0.1 development update #4: Major refactoring, requirements workshop April 11"
date = "2018-03-22T00:00:00+01:00"
tags = ["qmstr", "FOSS", "compliance"]
categories = ["qmstr"]
banner = "img/blog/qmstr-newsletter-7-title.jpg"
+++

After the basics of the Quartermaster toolchain are in place, we
focused on a refactoring of the master APIs. The key goal is to make
implementing modules for the three phases straightforward, composable
and as simple as possible. All modules now run in separate processes
that communicate with the master over the network. This decouples both
the module and the master code, as well as the licensing models of the
modules and the master. It is now possible to run multiple analysers
configurable from the master. Analyzers may report multiple
or overlapping findings of the same type, like copyright holders,
without interfering with each other. Based on this, we can now
implement modular reporters that generate HTML and SPDX, or
notifications, or other kinds of feedback.
<!--more-->

# Extended data model forms the basis for reporting

There is now an updated API for analyzers. What analyzers are run is
configured in the master configuration file. Analyzers extend the
master data model by adding information nodes to the build graph. You
will find a lot more and different kinds of nodes in it now (compared
to, for example, in [this previous post]({{< ref
"qmstr-newsletter-4.md" >}})). They represent analyzers, authors,
copyright holders and licenses:

{{< figure src="/img/blog/qmstr-newsletter-7-calc-graph.png" alt="A build graph with license and author information" width="100%" >}}

On top of that, a couple of other changes made it into the
repositories. It is now possible to run the master in a development
container and attach to it with the debugger. The service definitions
have been split and match the states the master goes through in it's
lifetime. And we presented Quartermaster at the Linux Foundation [Open
Source Leadership
Summit](https://events.linuxfoundation.org/events/open-source-leadership-summit-2018/program/schedule/)
in Sonoma Valley, CA.

## Plans for the upcoming sprint

We are now working on doing the same kind of refactoring for the
reporting API, and to finish first versions of the HTML/SPDX and the
notification reporter. With that complete, the basic Quartermaster
toolchain will be in place, and our focus will shift towards
implementing more build instrumentation, analysis and reporting
modules. Which means we are approaching a first release as planned. At
the end of sprint #5 we should have a release candidate for version
0.1, which will be polished and prepared for release in sprint #6.

## How to participate

Quartermaster will be presented at the [BCS Open Source
Specialist Group](http://ossg.bcs.org/) hosted event on [Yanking the
Chain: Open Source Software Compliance in the Supply
Chain](http://ossg.bcs.org/blog/2018/02/15/yanking-the-chain-open-source-software-compliance-in-the-supply-chain-london-22-3-2018/)
on March 22 in London.

The next [community hangout](https://meet.google.com/mqr-sqwi-cxn) is
scheduled for March 28, 2018, at 16:00 CET. Join us for a demo of the
sprint #5 results, and to plan sprint #6!

Sprint #6 will mark the end of development of Quartermaster v0.1. The
requirements workshop for version 0.2, which will be developed in the
second quarter of 2018, will take place on April 11, 2018, from 10am to
5pm, at the Endocode office on Berlin. Remember to register for a
seat using the contact form. We hope to see you there!

### Credits
Title image: [Thomas Rydberg, "Construction site", CC BY
2.0](https://www.flickr.com/photos/trydberg/8465499013) Thanks for
sharing!

