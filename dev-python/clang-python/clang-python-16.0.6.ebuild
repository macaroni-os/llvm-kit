# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit python-r1

DESCRIPTION=""
HOMEPAGE="https://llvm.org/"
SRC_URI="https://github.com/llvm/llvm-project/releases/download/llvmorg-16.0.6/llvm-project-16.0.6.src.tar.xz -> llvm-project-16.0.6.src.tar.xz"
LICENSE="Apache-2.0-with-LLVM-exceptions UoI-NCSA"
SLOT="0"
KEYWORDS="*"
DEPEND=">=sys-devel/clang-${PV}:*
	${PYTHON_DEPS}
	
"
RDEPEND="${PYTHON_DEPS}
	
"
S="${WORKDIR}/llvm-src/clang/bindings/python"
post_src_unpack() {
	mv llvm-project-* llvm-src
}
src_install() {
	python_foreach_impl python_domodule clang
}


# vim: filetype=ebuild
