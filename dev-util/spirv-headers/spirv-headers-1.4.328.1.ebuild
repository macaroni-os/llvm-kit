# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Machine-readable files for the SPIR-V Registry"
HOMEPAGE="https://registry.khronos.org/SPIR-V/ https://github.com/KhronosGroup/SPIRV-Headers"
SRC_URI="https://api.github.com/repos/KhronosGroup/SPIRV-Headers/tarball/refs/tags/vulkan-sdk-1.4.328.1 -> spirv-headers-1.4.328.1-01e0577.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
post_src_unpack() {
	mv KhronosGroup-SPIRV-Headers-* ${S}
}
src_configure() {
	local mycmakeargs=(
	  -DSPIRV_HEADERS_ENABLE_INSTALL=ON
	  -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR="${ESYSROOT}/usr/include/spirv"
	)
	cmake_src_configure
}


# vim: filetype=ebuild
