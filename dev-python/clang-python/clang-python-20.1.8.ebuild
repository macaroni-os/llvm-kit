# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit python-r1

DESCRIPTION="The LLVM Project is a collection of modular and reusable compiler and toolchain technologies."
HOMEPAGE="https://llvm.org/"
SRC_URI="https://github.com/llvm/llvm-project/releases/download/llvmorg-20.1.8/llvm-project-20.1.8.src.tar.xz -> llvm-project-20.1.8.src.tar.xz"
LICENSE="Apache-2.0-with-LLVM-exceptions UoI-NCSA"
SLOT="0"
KEYWORDS="*"
RDEPEND="${PYTHON_DEPS}
	
"
DEPEND=">=sys-devel/clang-${PV}:*
	${PYTHON_DEPS}
	
"
S="${WORKDIR}/llvm-src/clang/bindings/python"
post_src_unpack() {
	mv llvm-project-* llvm-src
}
src_install() {
	python_foreach_impl python_domodule clang
}


# vim: filetype=ebuild
