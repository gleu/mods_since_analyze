-- -----------------------------------------------------------------------------
-- uninstall_mods_since_analyze.sql
--
--    Uninstall mods_since_analyze extension module.
--
-- Copyright (c) 2013, Guillaume Lelarge (Dalibo),
-- guillaume.lelarge@dalibo.com
--
--
-- -----------------------------------------------------------------------------

DROP FUNCTION pg_stat_get_mod_since_analyze(oid);
