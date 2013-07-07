EXTENSION    = mods_since_analyze
EXTVERSION   = 1.0
EXTCOMMENT   = Expose the estimation of number of changed tuples since last analyze
MODULEDIR    = mods_since_analyze

MODULES      = $(EXTENSION)
#DOCS         = README.rst

PG_CONFIG    = pg_config
BUILD_EXTENSION = $(shell $(PG_CONFIG) --version | grep -qE "8\.|9\.0" && echo no || echo yes)

# Default (no Extension support)
DATA         = $(EXTENSION).sql uninstall_$(EXTENSION).sql
REGRESS      = $(EXTENSION)
pgext_files   := $(DOCS) $(DATA)

# Needed for building with extension support:
ifeq ($(BUILD_EXTENSION),yes)
all: $(EXTENSION)--$(EXTVERSION).sql $(EXTENSION)--unpackaged--$(EXTVERSION).sql

# Copy extension.sql to extension--version.sql:
$(EXTENSION)--$(EXTVERSION).sql: $(EXTENSION).sql
			cp $< $@

# Builds extension--unpackaged--version.sql from uninstall_extension.sql:
$(EXTENSION)--unpackaged--$(EXTVERSION).sql: uninstall_$(EXTENSION).sql
			sed 's/DROP /ALTER EXTENSION $(EXTENSION) ADD /' $< > $@

# Builds extension.control from extension.control.in
$(EXTENSION).control: $(EXTENSION).control.in
			sed 's/EXTVERSION/$(EXTVERSION)/;s/EXTENSION/$(EXTENSION)/;s/EXTCOMMENT/$(EXTCOMMENT)/' $< > $@

DATA        = $(EXTENSION)--unpackaged--$(EXTVERSION).sql $(EXTENSION)--$(EXTVERSION).sql
REGRESS     = $(EXTENSION).ext
EXTRA_CLEAN = $(DATA) $(EXTENSION).control
pgext_files  := $(DOCS)
endif

PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
