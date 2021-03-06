# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python3_4 )

inherit distutils-r1

DESCRIPTION="Stacking software for astronomical images"
HOMEPAGE="https://sites.google.com/site/mosstack"
SRC_URI="http://bitbucket.org/mikko_laine/mosstack/downloads/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="opencl qt4"

DEPEND=">=dev-python/numpy-1.8.0[${PYTHON_USEDEP}]
	dev-python/cython[${PYTHON_USEDEP}]"

RDEPEND=">=dev-python/pillow-2.3.0[${PYTHON_USEDEP}]
	sci-libs/scikits_image[${PYTHON_USEDEP}]
	>media-gfx/imagemagick-6.8.0.0
	sci-astronomy/sextractor
	media-gfx/dcraw
	media-libs/exiftool
	dev-python/astropy[${PYTHON_USEDEP}]
	opencl? ( >=dev-python/pyopencl-2013.1[${PYTHON_USEDEP}] )
	qt4? ( dev-python/PyQt4[${PYTHON_USEDEP}] )"

DOCS=( CHANGES.txt README.txt )
