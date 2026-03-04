# Paradiso

A course section-swap tool built for Yale students during a hackathon in August 2014. Students could log in via Yale CAS, submit requests to swap between sections of a course, and the app would run a graph-based matching algorithm (using the `rgl` gem) to find optimal sets of swaps (cycles in a directed graph).

## Archive Notice

**This repository is archived and no longer maintained.**

The app was built on Rails 4.1 and Ruby 2.1, both of which have been end-of-life for many years. It authenticates against Yale's CAS server, which is no longer accessible outside the university. Upgrading to a supported Rails version would require 2-4 days of work (9 incremental Rails version jumps, Ruby 2.1 to 3.1+, replacing multiple abandoned gems, rewriting the auth layer) with no practical benefit since the app has no users or deployment.

The most interesting piece of code is the `MatchMaker` module (`app/models/match_maker.rb`), which uses the `rgl` graph library to find swap cycles among student section-change requests. That algorithm has no Rails dependencies and could be extracted into a standalone script if needed.
