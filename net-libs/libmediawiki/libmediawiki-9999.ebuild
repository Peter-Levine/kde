# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="C++ interface for MediaWiki based web service as wikipedia.org"
HOMEPAGE="https://www.digikam.org/"

LICENSE="GPL-2+"
KEYWORDS=""
IUSE=""

DEPEND="
	$(add_frameworks_dep kcoreaddons)
	$(add_qt_dep qtnetwork)
"
RDEPEND="${DEPEND}
	!net-libs/libmediawiki:4
"

PATCHES=( "${FILESDIR}/${PN}-5.0.0_pre20170128-tests-optional.patch" )

src_test() {
	# bug 646808, 662592
	local myctestargs=(
		-j1
		-E "(libmediawiki-logintest|libmediawiki-logouttest|libmediawiki-queryimageinfotest|libmediawiki-queryimagestest|libmediawiki-queryinfotest|libmediawiki-querysiteinfousergroupstest)"
	)
	kde5_src_test
}
