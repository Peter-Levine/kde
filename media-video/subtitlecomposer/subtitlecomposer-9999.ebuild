# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="forceoptional"
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Text-based subtitles editor"
HOMEPAGE="https://github.com/maxrd2/subtitlecomposer"
EGIT_REPO_URI="https://github.com/maxrd2/${PN}"

LICENSE="GPL-2"
KEYWORDS=""
IUSE="gstreamer libav mpv unicode xine"

BDEPEND="
	sys-devel/gettext
	virtual/pkgconfig
"
DEPEND="
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kross)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep sonnet)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	media-libs/phonon[qt5(+)]
	gstreamer? (
		dev-libs/glib:2
		media-libs/gstreamer:1.0
		media-libs/gst-plugins-base:1.0
	)
	libav? ( media-video/libav:= )
	!libav? ( media-video/ffmpeg:0= )
	mpv? ( media-video/mpv )
	unicode? ( dev-libs/icu:= )
	xine? (
		media-libs/xine-lib
		x11-libs/libX11
		x11-libs/libxcb
	)
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_DISABLE_FIND_PACKAGE_PocketSphinx=ON # bug 616706
		$(cmake-utils_use_find_package gstreamer GStreamer)
		$(cmake-utils_use_find_package mpv MPV)
		$(cmake-utils_use_find_package unicode ICU)
		$(cmake-utils_use_find_package xine Xine)
		$(cmake-utils_use_find_package xine X11)
	)

	kde5_src_configure
}

pkg_postinst() {
	kde5_pkg_postinst

	elog "Some example scripts provided by ${PN} require dev-lang/ruby"
	elog "or dev-lang/python to be installed."
}
