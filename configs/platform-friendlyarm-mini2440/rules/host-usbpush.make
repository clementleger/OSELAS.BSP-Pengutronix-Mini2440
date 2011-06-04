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
HOST_PACKAGES-$(PTXCONF_HOST_USBPUSH) += host-usbpush

#
# Paths and names
#
HOST_USBPUSH_VERSION	:= 0.1
HOST_USBPUSH_MD5	:= 5b08cd14a15a66bdf43063684badc74f
HOST_USBPUSH		:= usbpush-$(HOST_USBPUSH_VERSION)
HOST_USBPUSH_SUFFIX	:= tar.bz2
HOST_USBPUSH_URL	:= http://www.pengutronix.de/software/ptxdist/temporary-src/$(HOST_USBPUSH).$(HOST_USBPUSH_SUFFIX)
HOST_USBPUSH_SOURCE	:= $(SRCDIR)/$(HOST_USBPUSH).$(HOST_USBPUSH_SUFFIX)
HOST_USBPUSH_DIR	:= $(HOST_BUILDDIR)/$(HOST_USBPUSH)
HOST_USBPUSH_LICENSE	:= GPLv2

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

$(HOST_USBPUSH_SOURCE):
	@$(call targetinfo)
	@$(call get, HOST_USBPUSH)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#HOST_USBPUSH_CONF_ENV	:= $(HOST_ENV)

#
# autoconf
#
HOST_USBPUSH_CONF_TOOL	:= autoconf
#HOST_USBPUSH_CONF_OPT	:= $(HOST_AUTOCONF)

#$(STATEDIR)/host-usbpush.prepare:
#	@$(call targetinfo)
#	@$(call clean, $(HOST_USBPUSH_DIR)/config.cache)
#	cd $(HOST_USBPUSH_DIR) && \
#		$(HOST_USBPUSH_PATH) $(HOST_USBPUSH_ENV) \
#		./configure $(HOST_USBPUSH_CONF_OPT)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/host-usbpush.compile:
#	@$(call targetinfo)
#	@$(call world/compile, HOST_USBPUSH)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/host-usbpush.install:
#	@$(call targetinfo)
#	@$(call world/install, HOST_USBPUSH)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/host-usbpush.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, HOST_USBPUSH)

# vim: syntax=make
