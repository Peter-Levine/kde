# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

KDE_GCC_MINIMAL="4.9"
inherit kde5

DESCRIPTION="Folder synchronization and backup tool for KDE"
HOMEPAGE="http://kde-apps.org/content/show.php/KFolderSync?content=164092"
SRC_URI="http://kde-apps.org/CONTENT/content-files/164092-${PN}-${PV}.tar.xz -> ${P}.tar.xz"

LICENSE="GPL-2+"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
"
DEPEND="${RDEPEND}
	sys-devel/gettext
"
