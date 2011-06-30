# Copyright (C) 2007 by Juergen Beisert
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
HOST_PACKAGES-$(PTXCONF_HOST_LIBUSB) += host-libusb

#
# Paths and names
#
HOST_LIBUSB_DIR	= $(HOST_BUILDDIR)/$(LIBUSB)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

HOST_LIBUSB_PATH	:= PATH=$(HOST_PATH)
HOST_LIBUSB_ENV 	:= $(HOST_ENV)
HOST_LIBUSB_AUTOCONF	:= $(HOST_AUTOCONF) \
	--disable-static

# vim: syntax=make
