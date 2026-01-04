# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7

DESCRIPTION="Meta-ebuild for clang runtime libraries"
HOMEPAGE="https://llvm.org/"
LICENSE="metapackage"
SLOT="20"
KEYWORDS="*"
IUSE="+compiler-rt libcxx openmp +sanitize"
REQUIRED_USE="sanitize? ( compiler-rt )
"
RDEPEND="compiler-rt? (
	  ~sys-libs/compiler-rt-20.1.8:${SLOT}
	  sanitize? ( ~sys-libs/compiler-rt-sanitizers-20.1.8:${SLOT} )
	)
	libcxx? ( >=sys-libs/libcxx-20.1.8 )
	openmp? ( >=sys-libs/libomp-20.1.8 )
	
"

# vim: filetype=ebuild
