# -*-makefile-*-
#
# Copyright (C) 2011 by Juergen Beisert <jbe@pengutronix.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_RING_BELL) += ring-bell

#
# Paths and names
#
RING_BELL_VERSION	:= 1.0
RING_BELL_MD5		:=
RING_BELL		:= ring-bell
RING_BELL_URL		:= file://$(PTXDIST_PLATFORMCONFIGDIR)/local_src/$(RING_BELL)-$(RING_BELL_VERSION)
RING_BELL_DIR		:= $(BUILDDIR)/$(RING_BELL)
RING_BELL_LICENSE	:= GPLv2

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

RING_BELL_CONF_TOOL	:= NO
RING_BELL_MAKE_ENV	:= $(CROSS_ENV)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/ring-bell.targetinstall:
	@$(call targetinfo)

	@$(call install_init, ring-bell)
	@$(call install_fixup, ring-bell,PRIORITY,optional)
	@$(call install_fixup, ring-bell,SECTION,base)
	@$(call install_fixup, ring-bell,AUTHOR,"Juergen Beisert <jbe@pengutronix.de>")
	@$(call install_fixup, ring-bell,DESCRIPTION, "ring bell via input subsystem")

	@$(call install_copy, ring-bell, 0, 0, 0755, -, /usr/bin/ring-bell)
	@$(call install_finish, ring-bell)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

$(STATEDIR)/ring-bell.clean:
	@$(call targetinfo)
	@-cd $(RING_BELL_DIR) && \
		$(RING_BELL_ENV) $(RING_BELL_PATH) $(MAKE) clean
	@$(call clean_pkg, RING_BELL)

# vim: syntax=make
