# -*-makefile-*-
#
# Copyright (C) 2009 by Michael Olbrich <m.olbrich@pengutronix.de>
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
PACKAGES-$(PTXCONF_QT4_DEMO) += qt4-demo

#
# Paths and names
#
QT4_DEMO_VERSION	:= 2011.11.0
QT4_DEMO		:= qt4-demo-$(QT4_DEMO_VERSION)
QT4_DEMO_URL		:= file://$(PTXDIST_WORKSPACE)/local_src/$(QT4_DEMO)
QT4_DEMO_DIR		:= $(BUILDDIR)/$(QT4_DEMO)
QT4_DEMO_BUILD_OOT	:= YES
QT4_DEMO_BUILDDIR	:= $(BUILDDIR)/$(QT4_DEMO)-build

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

$(QT4_DEMO_SOURCE):
	@$(call targetinfo)
	@$(call get, QT4_DEMO)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/qt4-demo.targetinstall:
	@$(call targetinfo)

	@$(call install_init, qt4-demo)
	@$(call install_fixup, qt4-demo,PACKAGE,qt4-demo)
	@$(call install_fixup, qt4-demo,PRIORITY,optional)
	@$(call install_fixup, qt4-demo,VERSION,$(QT4_DEMO_VERSION))
	@$(call install_fixup, qt4-demo,SECTION,base)
	@$(call install_fixup, qt4-demo,AUTHOR,"Michael Olbrich <m.olbrich@pengutronix.de>")
	@$(call install_fixup, qt4-demo,DEPENDS,)
	@$(call install_fixup, qt4-demo,DESCRIPTION, "Simple Qt4 Demo App")

# install the essentials of this build to the target

	@$(call install_copy, qt4-demo, 0, 0, 0755, \
		$(QT4_DEMO_BUILDDIR)/qt4-demo, \
		/usr/bin/qt4-demo)

	@$(call install_copy, qt4-demo, 0, 0, 0755, \
		$(QT4_DEMO_DIR)/qt4-demo-load, \
		/usr/bin/qt4-demo-load)

	@$(call install_alternative, qt4-demo, 0, 0, 0755, \
		/etc/rc.once.d/tscalibrate)

	@$(call install_finish, qt4-demo)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

qt4-demo_clean:
	rm -rf $(STATEDIR)/qt4-demo.*
	rm -rf $(PKGDIR)/qt4-demo_*
	rm -rf $(QT4_DEMO_DIR)

# vim: syntax=make
