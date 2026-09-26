# Contributions

Comments explain current API contracts, non-obvious constraints and decisions
that the code cannot express clearly. Delete narration, repetition and debugging
history. Keep release history in CHANGELOG or release notes, not source comments.

The shared comment guard permits three lines for internal comments, eight prose
lines for item Rustdoc and sixteen for module Rustdoc. Fenced examples are
excluded. These are limits, not targets; a short useless comment is still useless.
Do not evade a limit by changing comment syntax or moving prose to another file.

Public repos have no root `docs/` directory. Put API contracts beside the public
items in Rustdoc and build/usage instructions in README. Standalone specifications
may describe an actual public file format; release-note inputs stay with the
release workflow. Neither is a destination for excess source commentary.

CI checks comment limits, root docs directories and stale local-doc pointers.
Reviewers assess usefulness and correctness; keyword matching cannot do that.
