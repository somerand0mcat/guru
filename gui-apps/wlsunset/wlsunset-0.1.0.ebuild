# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

if [[ "${PV}" == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.sr.ht/~kennylevinsen/wlsunset"
else
	KEYWORDS="~amd64"
	SRC_URI="https://git.sr.ht/~kennylevinsen/wlsunset/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="Day/night gamma adjustments for Wayland"
HOMEPAGE="https://sr.ht/~kennylevinsen/wlsunset/"
LICENSE="MIT"
SLOT="0"

BDEPEND="
	dev-util/wayland-scanner
	dev-libs/wayland-protocols
	app-text/scdoc
"
DEPEND="dev-libs/wayland"
RDEPEND="${DEPEND}"

src_configure() {
	local emesonargs=(
		-Dwerror=false
		-Dman-pages=enabled
	)

	meson_src_configure
}
