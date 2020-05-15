# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
ETYPE="sources"
KEYWORDS="~amd64 ~x86"

HOMEPAGE="https://dev.gentoo.org/~mpagano/genpatches/
	http://kernel.kolivas.org/"

IUSE="experimental"

K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="16"
K_SECURITY_UNSUPPORTED="1"
CK_EXTRAVERSION="ck2"

inherit kernel-2
detect_version
detect_arch

DESCRIPTION="Gentoo's genpatches for Linux ${K_BRANCH_ID}, with Con Kolivas' MuQSS scheduler and patchset"

K_BRANCH_ID="${KV_MAJOR}.${KV_MINOR}"

CK_URI="http://ck.kolivas.org/patches/5.0/${K_BRANCH_ID}/${K_BRANCH_ID}-${CK_EXTRAVERSION}/patch-${K_BRANCH_ID}-${CK_EXTRAVERSION}.xz"

SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI} ${CK_URI}"

UNIPATCH_LIST="${DISTDIR}/patch-${K_BRANCH_ID}-${CK_EXTRAVERSION}.xz
	"${FILESDIR}"/1012_linux-5.6.13.patch
	"${FILESDIR}"/${CK_EXTRAVERSION}-revert-version.patch
	"${FILESDIR}"/funtoo.patch"

UNIPATCH_STRICTORDER="yes"
