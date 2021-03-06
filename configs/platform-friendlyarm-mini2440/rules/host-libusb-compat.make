# -*-makefile-*-
# $Id: template-make 9053 2008-11-03 10:58:48Z wsa $
#
# Copyright (C) 2009 by Robert Schwebel <r.schwebel@pengutronix.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_HOST_LIBUSB_COMPAT) += host-libusb-compat

#
# Paths and names
#
HOST_LIBUSB_COMPAT_DIR	= $(HOST_BUILDDIR)/$(LIBUSB_COMPAT)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

HOST_LIBUSB_COMPAT_PATH	:= PATH=$(HOST_PATH)
HOST_LIBUSB_COMPAT_ENV 	:= $(HOST_ENV)
HOST_LIBUSB_COMPAT_AUTOCONF := $(HOST_AUTOCONF) \
	--disable-static

# vim: syntax=make
