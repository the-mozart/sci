# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools-utils

SRC_URI="http://www.tcs.hut.fi/Software/${PN}/${P}.zip"
DESCRIPTION="A Tool for Computing Automorphism Groups and Canonical Labelings of Graphs"
HOMEPAGE="http://www.tcs.hut.fi/Software/bliss/index.shtml"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc gmp"

RDEPEND="gmp? ( dev-libs/gmp )"

DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )"

AUTOTOOLS_AUTORECONF=1

PATCHES=(
	"${FILESDIR}/${P}-fedora.patch"
	"${FILESDIR}/${P}-autotools.patch"
)

src_configure() {
	local myeconfargs=( $(use_with gmp) )
	autotools-utils_src_configure
}

src_install() {
	autotools-utils_src_install
	if use doc; then
		cd "${BUILD_DIR}"
		emake html
		dohtml -r html
	fi
}
