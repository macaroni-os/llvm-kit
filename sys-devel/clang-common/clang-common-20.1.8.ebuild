# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit bash-completion-r1

DESCRIPTION="Common files shared between multiple slots of clang"
HOMEPAGE="https://llvm.org/"
SRC_URI="https://github.com/llvm/llvm-project/releases/download/llvmorg-20.1.8/llvm-project-20.1.8.src.tar.xz -> llvm-project-20.1.8.src.tar.xz"
LICENSE="Apache-2.0-with-LLVM-exceptions UoI-NCSA BSD public-domain rc"
SLOT="0"
KEYWORDS="*"
PDEPEND="sys-devel/clang:*
	
"
S="${WORKDIR}/llvm-src/clang/utils"
post_src_unpack() {
	mv llvm-project-* llvm-src
}
src_install() {
	newbashcomp bash-autocomplete.sh clang
}


# vim: filetype=ebuild
