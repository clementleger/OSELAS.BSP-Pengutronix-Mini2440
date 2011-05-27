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
# Get
# ----------------------------------------------------------------------------

$(STATEDIR)/host-libusb.get:$(STATEDIR)/libusb.get
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

$(STATEDIR)/host-libusb.extract:
	@$(call targetinfo)
	@$(call clean, $(HOST_LIBUSB_DIR))
	@$(call extract, LIBUSB, $(HOST_BUILDDIR))
	@$(call patchin, LIBUSB, $(HOST_LIBUSB_DIR))
	@$(call touch)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

HOST_LIBUSB_PATH	:= PATH=$(HOST_PATH)
HOST_LIBUSB_ENV 	:= $(HOST_ENV)

#
# autoconf
#
HOST_LIBUSB_AUTOCONF	:= $(HOST_AUTOCONF) \
	--disable-static

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

host-libusb_clean:
	@rm -rf $(STATEDIR)/host-libusb.*
	@rm -rf $(HOST_LIBUSB_DIR)

# vim: syntax=make
