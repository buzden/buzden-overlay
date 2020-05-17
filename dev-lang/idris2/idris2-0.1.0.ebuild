# Copyright 2020 Denis Buzdalov
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="A dependently typed programming language, a successor to Idris"
HOMEPAGE="https://github.com/edwinb/Idris2"
SRC_URI="https://github.com/edwinb/Idris2/archive/v${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/Idris2-${PV}"

LICENSE="BSD"
SLOT="0/${PV}"

KEYWORDS="~amd64"

COMMON_DEP="
	dev-scheme/chezscheme
"

BDEPEND="
	~dev-lang/idris-1.3.2
	sys-devel/clang
	${COMMON_DEP}
"

RDEPEND="
	${COMMON_DEP}
"

# `only=...` setting means that it should be tested while builting only on this test suite.
# Testing is included essentially into the building targets of Idris2.

src_compile() {
	emake only=idris2
}

src_install() {
	emake DESTDIR="${D}" only=idris2 install
}
