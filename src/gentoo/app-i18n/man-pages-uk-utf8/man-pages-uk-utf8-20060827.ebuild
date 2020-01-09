# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-i18n/man-pages-uk-utf8/man-pages-uk-utf8-20060827.ebuild,v 0.2 2006/08/26 14:35:45 hse Exp $

inherit eutils

DESCRIPTION="Ukranian translations of Uinux manual pages."
HOMEPAGE="http://docs.linux.org.ua/index.php/Man:Contents
	http://wiki2man.sourceforge.net"
SRC_URI="mirror://sourceforge/wiki2man/man-pages-uk-utf8-${PV}.tar.bz2"


LICENSE="FDL-1.2"
SLOT="0"
IUSE=""
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc-macos ~ppc64 ~s390 ~sh ~sparc x86 ~x86_fbsd"

DEPEND="app-arch/gzip"
RDEPEND="sys-apps/man"

src_compile() {
	emake || die "Compile error"
}

src_install() {
	emake INSTALLPATH=${D}/usr/share/man LANG_SUBDIR=uk install || die "Install error"
	prepallman
}
