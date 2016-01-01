# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

KDE_DEBUG="false"
KDE_DOXYGEN="false"
KDE_TEST="false"
DISTUTILS_SINGLE_IMPL="true"
PYTHON_COMPAT=( python2_7 )
inherit kde5 distutils-r1

DESCRIPTION="Framework for building KDE API documentation in a standard format and style"
LICENSE="BSD-2"
KEYWORDS=""
IUSE=""

RDEPEND="
	app-doc/doxygen
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	media-gfx/graphviz[python,${PYTHON_USEDEP}]
"

pkg_setup() {
	python-single-r1_pkg_setup
	kde5_pkg_setup
}
