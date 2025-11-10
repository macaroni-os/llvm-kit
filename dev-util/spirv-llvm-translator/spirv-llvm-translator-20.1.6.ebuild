# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
CMAKE_BUILD_TYPE=RelWithDebInfo
inherit cmake-utils flag-o-matic

DESCRIPTION="Bi-directional translator between SPIR-V and LLVM IR"
HOMEPAGE="https://github.com/KhronosGroup/SPIRV-LLVM-Translator"
SRC_URI="https://api.github.com/repos/KhronosGroup/SPIRV-LLVM-Translator/tarball/refs/tags/v20.1.6 -> spirv-llvm-translator-20.1.6-a9e5440.tar.gz"
LICENSE="UoI-NCSA"
SLOT="20"
KEYWORDS="*"
IUSE="tools clang"
RDEPEND="sys-devel/clang:20=
	
"
DEPEND=">=dev-util/spirv-headers-1.4.328.1
	${RDEPEND}
	clang? (
	  sys-devel/clang:20=
	)
	
"
post_src_unpack() {
	mv KhronosGroup-SPIRV-LLVM-Translator-* ${S}
}
src_prepare() {
	append-flags -fPIC
	cmake-utils_src_prepare
}
src_configure() {
	if use clang; then
	  extra_cflags="-I/usr/lib/clang/20/include/"
	  export CPPFLAGS="-I/usr/lib/clang/20/include/"
	  local -x CC=${CHOST}-clang
	  local -x CXX=${CHOST}-clang++
	  strip-unsupported-flags
	fi
	local mycmakeargs=(
	  -DCMAKE_INSTALL_PREFIX="${EPREFIX}/usr/lib/llvm/20/"
	  -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR="${ESYSROOT}/usr/include/spirv"
	  -DBUILD_SHARED_LIBS=True
	  -DLLVM_BUILD_TOOLS=$(usex tools "ON" "OFF")
	)
	cmake-utils_src_configure
}
src_install() {
	cmake-utils_src_install
	# Do not install pkgconfig data files, pkg-config does not presently look at
	# /usr/lib/llvm/.../pkgconfig and putting them in /usr/lib*/pkgconfig would
	# cause collisions between slots.
}


# vim: filetype=ebuild
