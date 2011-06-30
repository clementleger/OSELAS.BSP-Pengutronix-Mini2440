# -*-makefile-*-
# $Id: template-make 9053 2008-11-03 10:58:48Z wsa $
#
# Copyright (C) 2009 by Luotao Fu <l.fu@pengutronix.de
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_STARTUP) += startup

#
# Paths and names
#
STARTUP		:= startup
STARTUP_VERSION	:= 0.1
STARTUP_SUFFIX	:=
STARTUP_URL	:=
STARTUP_SOURCE	:=
STARTUP_DIR	:= $(BUILDDIR)/$(STARTUP)

# ----------------------------------------------------------------------------
# Get (nothing to do here)
# ----------------------------------------------------------------------------

$(STARTUP_SOURCE):
	@$(call targetinfo)

# ----------------------------------------------------------------------------
# Extract (nothing to do here)
# ----------------------------------------------------------------------------

$(STATEDIR)/startup.extract:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Prepare (nothing to do here)
# ----------------------------------------------------------------------------

$(STATEDIR)/startup.prepare:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Compile (nothing to do here)
# ----------------------------------------------------------------------------

$(STATEDIR)/startup.compile:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Install (nothing to do here)
# ----------------------------------------------------------------------------

$(STATEDIR)/startup.install:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/startup.targetinstall:
	@$(call targetinfo)

	@$(call install_init, startup)
	@$(call install_fixup, startup,PACKAGE,startup)
	@$(call install_fixup, startup,PRIORITY,optional)
	@$(call install_fixup, startup,VERSION,$(STARTUP_VERSION))
	@$(call install_fixup, startup,SECTION,base)
	@$(call install_fixup, startup,AUTHOR,"Luotao Fu <l.fu@pengutronix.de>")
	@$(call install_fixup, startup,DEPENDS,)
	@$(call install_fixup, startup,DESCRIPTION,"Simple start script")

	@$(call install_copy, startup, 0, 0, 0755, \
		$(PTXDIST_WORKSPACE)/projectroot/etc/init.d/startup, \
		/etc/init.d/startup, n)
	@$(call install_link, startup, ../init.d/startup, /etc/rc.d/S99startup)

	@$(call install_finish, startup)

	@$(call touch)

# vim: syntax=make
