+++
title = "Quartermaster Milestone 1 Development Report: Voila, a modular, extendable FOSS Compliance Toolchain"
date = "2018-04-25T00:00:00+01:00"
tags = ["qmstr", "FOSS", "compliance", "milestone", "report"]
categories = ["qmstr"]
banner = "img/blog/qmstr-ms-1-report-title.png"
+++

Version 0.1 is here. After a proof-of-concept, plenty of drafting,
feedback and discussions, a prototype, and finally three months of
development focused on creating a useful product, we are tagging a
first version of Quartermaster. The theme of the first version was to
implement the toolchain basics: the compliance knowledge graph, the
master container, the elemental workflow with a construction, analysis
and reporting phase, and the APIs for modules to interact with the
knowledge graph in each of these phases. There are public showcases
that demonstrate the functionality implemented so far. After gathering
functional and legal requirements, the team will now move on to
milestone 2, where we will focus on making use of the building blocks
from the first version to implement badly needed functions of
generating license compliance documentation - an SPDX manifest
analyzer, integration with Fossology, and features to aggregate
analysis results from different sources into reports.
<!--more-->

# Quartermaster Version 0.1

This is literally Quartermaster's first birthday. The project was
incepted at the Legal and Licensing Workshop 2017 that started on
April 25, 2017 -- exactly one year ago. The project had a great if turbulent
first year, and now we are admiring our first version and say "Geez,
this is one cute baby!" Come have a peek into the crib:

{{< figure src="/img/blog/qmstr-ms-1-report-title.png" alt="Happy birthday, Quartermaster!" width="60%" >}}

<br />

## Key features

So what can you expect from Quartermaster 0.1? Compare further the
architectural overview
in [dev update 3]({{< ref "qmstr-newsletter-6.md" >}}) -- all the key
elements are there. The master implements the workflow phases and
manages the compliance knowledge graph. It also acts as the state
machine that models the workflow into the construction, analysis and
reporting phases. For each of the phases, gRPC based APIs have been
designed that clients (the modules) use to communicate with the
master. A first set of modules exists that covers the functions of the
three phases. Build graphs can currently be generated for builds using
the GNU compiler collection, and for Gradle-based Java programs. A
ScanCode analysis module and a rudimentary SPDX analyzer exist that
augment the knowledge graph with compliance data. A first reporting
module generates static HTML from the graph that can be published on a
web site or integrated into products and shipped with them. "Show
me!", you say? Sure:

{{< figure src="/img/blog/QMSTR-curl-pipeline.png" alt="A Quartermaster pipeline building curl" width="100%" >}}

<br />

There is a [containerized showcase](https://github.com/QMSTR/qmstr-demo) that
builds
curl
[in a Jenkins pipeline on Endocode's CI](https://ci.endocode.com/blue/organizations/jenkins/QMSTR%2Fqmstr-cURL-demo/activity),
and then publishes the results to the [package documentation section of
the Quartermaster web site](http://qmstr.org/packages/). This setup
roughly matches a common use case -- ingesting a source code package
to be a dependency to a product, and in the process evaluating
license compliance and creating documentation for internal or external
use. It is also how we imagine communities or businesses would use
Quartermaster: integrated in the regular continuous integration setup,
against versioned repositories of packages, and communicating with
other systems like documentation web sites, issue tracking or instant
messaging.


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
aspects of the project are open for collaboration, it is truly Open
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

## The road to version 0.2

If you dig through the documentation generated by the showcase, you
may notice that there are still plenty of gaps at the version
level. As every newborn, ours is still learning to walk, talk and then
to go hang out and party with the other 2 year olds. If the theme of
version 0.1 was "the workflow toolchain", the theme of milestone two
will be "documentation". On April 11, 2018 we held the milestone 2
requirements workshop. During the Legal and Licensing Workshop 2018,
participants gave feedback and identified more requirements. This
input was poured into a milestone roadmap roughly represented by the
tickets in
the
[QMSTR super repository](https://github.com/QMSTR/qmstr-all/milestones?direction=asc&sort=due_date&state=open). After
some housekeeping, we will implement implement SPDX metadata handling
for analysis, and extend the current reporting modules. Some effort
will be invested into creating an automated integration testing
environment to ensure the stability of the toolchain. Details for the
final three sprints will be identified as we go (or maybe based on
your feedback?). Expect version 0.2 in early July, and the next
requirements workshop for version 0.3 in mid July 2018.

## How to participate and how to help

Quartermaster is currently being developed mainly by Endocode with the
support of Siemens, Google and the Linux Foundation. Since the project
is completely Open Source, it needs your support, any help is welcome:
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
colocated with a major Open Source conference. If you are
interested, please let us know so that can start making plans.

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

Title image: [Will Clayton, "Birthday Cake", CC BY 2.0](https://www.flickr.com/photos/spool32/5045502202) Thanks for
sharing!

