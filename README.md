mods_since_analyze
==================

This extension was interesting years ago when 9.0 to 9.3 releases were still
maintained. So, this won't be updated since the feature it delivers is now on
every maintained PostgreSQL releases.

mods_since_analyze is a PostgreSQL extension that exposes the estimation of
number of changed tuples on a table since last analyze through the function
pg_stat_get_mod_since_analyze(oid).

The pg_stat_get_mod_since_analyze() function is originally written by Mark
Kirkwood for PostgreSQL 9.4 release. It's been commited in the PostgreSQL
git repository (see commit c87ff71f374652936a6089215a30998492b14d52). Many
thanks to him, and his reviewer (Albe Laurenz), and his committer (Magnus
Hagander).

This extension allows anyone to get this information on older releases (from
9.0 to 9.3).
