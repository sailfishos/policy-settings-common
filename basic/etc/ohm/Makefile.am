RULESET      = $(notdir $(shell cd ../..; pwd))
EXTRA_DIST   = $(plugin_DATA) $(config_DATA)
plugindir    = $(datadir)/policy/etc/$(RULESET)/ohm/plugins.d
plugin_DATA  = gconf.ini accessories.ini
configdir    = $(datadir)/policy/etc/$(RULESET)/ohm
config_DATA  = ohmd.ini modules.ini

MAINTAINERCLEANFILES = Makefile.in

install-data-hook: install-symlinks

install-symlinks:
	if test "x$(INSTALL_SYMLINKS)" = "x1"; then                           \
	    mkdir -p $(DESTDIR)/$(sysconfdir)/ohm;                            \
	    for f in $(config_DATA); do                                       \
	        if ! test -e $(DESTDIR)/$(sysconfdir)/ohm/$$f; then           \
	            ln -sf $(datadir)/policy/etc/current/ohm/$$f              \
	                     $(DESTDIR)$(sysconfdir)/ohm;                     \
	        fi;                                                           \
	    done;                                                             \
	    mkdir -p $(DESTDIR)/$(sysconfdir)/ohm/plugins.d;                  \
	    for f in $(plugin_DATA); do                                       \
	        if ! test -e $(DESTDIR)/$(sysconfdir)/ohm/plugins.d/$$f; then \
	            ln -sf $(datadir)/policy/etc/current/ohm/plugins.d/$$f    \
                             $(DESTDIR)/$(sysconfdir)/ohm/plugins.d;          \
	        fi                                                            \
	    done                                                              \
	fi
