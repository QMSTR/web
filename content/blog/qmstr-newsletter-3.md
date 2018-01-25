+++
title = "Quartermaster prototype development update #3"
date = "2018-01-25T00:00:00+01:00"
tags = ["qmstr", "FOSS", "compliance", "cmake"]
categories = ["qmstr"]
banner = "img/blog/qmstr-newsletter-2-title.jpg"
+++

The third Quartermaster development sprint marked the end of
development of the Quartermaster prototype. Our main goals for the
prototype was to work with our partners and collaborators to develop
an approach to FOSS compliance automation that delivers correct and
complete results in a variety of use cases. The integration of new
build systems has been tested, the workflow phases have been refined
and abstracted further and limits of the prototype design
identified. We wrapped up the sprint with a workshop where the
functionality of the prototype was evaluated and the findings applied
to a draft architecture of the first production release of
Quartermaster.

# Sprint #3: cmake, curl, more Jenkins, Go

In terms of feature development, sprint #3 was a wild ride. We
extended the build tracing toolchain to support the rather popular
`cmake` build system. This allowed us to set up a demo of an
instrumented build of the version of `curl` that was modified as part
of the Reuse project to contain license identifiers across the
board. We worked further on the concept of implementing web based
feedback visualisations that support feedback formats like warnings
and binary or coefficient type metrics. This will serve as a
foundation for future features of the integrations into CI and
repository hosting systems. Finally, we investigated how to instrument
the Go language build system and showed that build tracing works as
needed. While not all these efforts result in glossy features in the
prototype, they are the basis for production features in
Quartermaster. Overall, we have achieved the goals set for the
development of the prototype, and are now ready to transition into
developing a first generally available version.

## Towards an architecture vision for a FOSS compliance toolchain

## Next steps: version 0.1! demos! sweat and tears!

### Credits
Title image: [Angela Mueller, "Macro Lens", CC BY 2.0](https://www.flickr.com/photos/22103696@N07/4591184598)

