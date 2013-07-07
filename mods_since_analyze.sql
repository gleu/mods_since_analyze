-- -----------------------------------------------------------------------------
-- mods_since_analyze.sql
--
--    Install mods_since_analyze extension module.
--
-- Copyright (c) 2013, Guillaume Lelarge (Dalibo),
-- guillaume.lelarge@dalibo.com
--
--
-- -----------------------------------------------------------------------------

-- Register functions.
CREATE OR REPLACE FUNCTION pg_stat_get_mod_since_analyze(oid)
RETURNS bigint
AS '$libdir/mods_since_analyze'
LANGUAGE C;

GRANT EXECUTE ON FUNCTION pg_stat_get_mod_since_analyze(oid) TO public;
