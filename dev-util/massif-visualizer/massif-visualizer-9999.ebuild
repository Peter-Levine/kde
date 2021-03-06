# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="forceoptional"
inherit kde5

DESCRIPTION="Tool visualising massif data"
HOMEPAGE="https://www.linux-apps.com/content/show.php/Massif+Visualizer?content=122409"

LICENSE="|| ( GPL-2 GPL-3 )"
KEYWORDS=""
IUSE="+callgraph"

RDEPEND="
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets)
	dev-libs/kdiagram:5
	callgraph? ( media-gfx/kgraphviewer:5 )
"
DEPEND="${RDEPEND}
	$(add_qt_dep qtxmlpatterns)
"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package callgraph KGraphViewerPart)
	)
	kde5_src_configure
}
