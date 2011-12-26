# -*-makefile-*-
#
# Copyright (C) 2009 by Michael Olbrich <m.olbrich@pengutronix.de>
# Copyright (C) 2011 by Juergen Beisert <jbe@pengutronix.de>
# Copyright (C) 2011 by Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_QML_DEMO) += qml-demo

#
# Paths and names
#
QML_DEMO_VERSION	:= 2011.12.0
QML_DEMO		:= qml-demo-$(QML_DEMO_VERSION)
QML_DEMO_URL		:= file://$(PTXDIST_WORKSPACE)/local_src/$(QML_DEMO)
QML_DEMO_DIR		:= $(BUILDDIR)/$(QML_DEMO)
QML_DEMO_BUILD_OOT	:= YES
QML_DEMO_BUILDDIR	:= $(BUILDDIR)/$(QML_DEMO)-build

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

$(QML_DEMO_SOURCE):
	@$(call targetinfo)
	@$(call get, QML_DEMO)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/qml-demo.targetinstall:
	@$(call targetinfo)

	@$(call install_init, qml-demo)
	@$(call install_fixup, qml-demo,PACKAGE,qml-demo)
	@$(call install_fixup, qml-demo,PRIORITY,optional)
	@$(call install_fixup, qml-demo,VERSION,$(QML_DEMO_VERSION))
	@$(call install_fixup, qml-demo,SECTION,base)
	@$(call install_fixup, qml-demo,AUTHOR,"Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>")
	@$(call install_fixup, qml-demo,DEPENDS,)
	@$(call install_fixup, qml-demo,DESCRIPTION, "Simple QML Demo App")

# install the essentials of this build to the target
	@$(call install_copy, qml-demo, 0, 0, 0755, \
		$(QML_DEMO_BUILDDIR)/qml-demo, \
		/usr/bin/qml-demo)

	@$(call install_copy, qml-demo, 0, 0, 0755, /usr/lib/qml-demo)

# copy the QML tree to the target as-is.
	@$(call install_tree, qml-demo, 0, 0, $(QML_DEMO_DIR)/qml, \
		/usr/lib/qml-demo)
	@$(call install_alternative, qml-demo, 0, 0, 0755, \
		/etc/rc.once.d/tscalibrate)

ifdef PTXCONF_MINI2440_DEMO_SYSTEMD_UNIT
	@$(call install_copy, qml-demo, 0, 0, 0644, \
		$(QML_DEMO_DIR)/init/systemd/qmldemo.service, \
		/lib/systemd/system/qmldemo.service)
	@$(call install_link, qml-demo, ../qmldemo.service, \
		/lib/systemd/system/multi-user.target.wants/qmldemo.service)
endif
ifdef PTXCONF_MINI2440_DEMO_STARTUP_SCRIPT
	@$(call install_copy, qml-demo, 0, 0, 0755, \
		$(QML_DEMO_DIR)/init/sysv/startup, \
		/etc/init.d/startup, n)
	@$(call install_link, qml-demo, ../init.d/startup, /etc/rc.d/S99startup)
endif

	@$(call install_finish, qml-demo)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

qml-demo_clean:
	rm -rf $(STATEDIR)/qml-demo.*
	rm -rf $(PKGDIR)/qml-demo_*
	rm -rf $(QML_DEMO_DIR)

# vim: syntax=make
