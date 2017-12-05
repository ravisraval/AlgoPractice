### Clones

* *load balancer* distributes load (user reqs) onto app servers.
* each server must have exact same codebase and can't store any user-related data,
like sessions or profile pics
* Sessions / user-data must be in an external database or external persistent cache,
which has the ability to send all servers code changes simultaneously, or at least
to the extent that one server won't serve old code
