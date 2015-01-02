/*-------------------------------------------------------------------------
 *
 *  mods_since_analyze.c
 *  Expose the estimation of number of changed tuples since last analyze.
 *
 *
 *  Copyright (c) 2013-2015, Guillaume Lelarge (Dalibo),
 *  guillaume.lelarge@dalibo.com
 *
 *-------------------------------------------------------------------------
 */

#include <stdio.h>
#include "postgres.h"
#include "pgstat.h"

PG_MODULE_MAGIC;

PG_FUNCTION_INFO_V1(pg_stat_get_mod_since_analyze);

Datum pg_stat_get_mod_since_analyze(PG_FUNCTION_ARGS);

Datum
pg_stat_get_mod_since_analyze(PG_FUNCTION_ARGS)
{
       Oid                     relid = PG_GETARG_OID(0);
       int64           result;
       PgStat_StatTabEntry *tabentry;

       if ((tabentry = pgstat_fetch_stat_tabentry(relid)) == NULL)
               result = 0;
       else
               result = (int64) (tabentry->changes_since_analyze);

       PG_RETURN_INT64(result);
}
