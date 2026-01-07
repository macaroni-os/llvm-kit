# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit cmake python-any-r1

DESCRIPTION="OpenCL C library"
HOMEPAGE="https://libclc.llvm.org/"
SRC_URI="https://github.com/llvm/llvm-project/releases/download/llvmorg-20.1.8/llvm-project-20.1.8.src.tar.xz -> llvm-project-20.1.8.src.tar.xz"
LICENSE="Apache-2.0-with-LLVM-exceptions UoI-NCSA BSD public-domain rc"
SLOT="20"
KEYWORDS="*"
IUSE="spirv video_cards_nvidia video_cards_r600 video_cards_radeonsi"
BDEPEND="${PYTHON_DEPS}
	sys-devel/clang:20
	spirv? ( dev-util/spirv-llvm-translator:20 )
	
"
S="${WORKDIR}/llvm-src/libclc"
post_src_unpack() {
	mv llvm-project-* llvm-src
}
pkg_setup() {
	python-any-r1_pkg_setup
}
src_configure() {
	local libclc_targets=()
	use spirv && libclc_targets+=(
	  "spirv-mesa3d-"
	  "spirv64-mesa3d-"
	)
	use video_cards_nvidia && libclc_targets+=(
	  "nvptx--"
	  "nvptx64--"
	  "nvptx--nvidiacl"
	  "nvptx64--nvidiacl"
	)
	use video_cards_r600 && libclc_targets+=(
	  "r600--"
	)
	use video_cards_radeonsi && libclc_targets+=(
	  "amdgcn--"
	  "amdgcn-mesa-mesa3d"
	  "amdgcn--amdhsa"
	)
	[[ ${#libclc_targets[@]} ]] || die "libclc target missing!"
	libclc_targets=${libclc_targets[*]}
	local mycmakeargs=(
	  -DLIBCLC_TARGETS_TO_BUILD="${libclc_targets// /;}"
	  -DLLVM_CONFIG_PATH="/usr/lib/llvm/20/bin/llvm-config"
	)
	cmake_src_configure
}


# vim: filetype=ebuild
