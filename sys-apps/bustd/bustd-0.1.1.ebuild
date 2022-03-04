# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.0

EAPI=8

CRATES="
	adler-1.0.2
	argh-0.1.5
	argh_derive-0.1.5
	argh_shared-0.1.5
	autocfg-1.0.1
	bitflags-1.2.1
	boxfnonce-0.1.1
	byteorder-1.4.3
	bustd-0.1.1
	cc-1.0.68
	cfg-if-1.0.0
	chrono-0.4.19
	crc32fast-1.2.1
	daemonize-0.4.1
	flate2-1.0.20
	glob-0.3.0
	heck-0.3.3
	hex-0.4.3
	lazy_static-1.4.0
	libc-0.2.97
	miniz_oxide-0.4.4
	num-integer-0.1.44
	num-traits-0.2.14
	proc-macro2-1.0.27
	procfs-0.9.1
	quote-1.0.9
	syn-1.0.73
	time-0.1.44
	unicode-segmentation-1.8.0
	unicode-xid-0.2.2
	wasi-0.10.0+wasi-snapshot-preview1
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-x86_64-pc-windows-gnu-0.4.0
"
CONFIG_CHECK="PSI"

inherit linux-info cargo

DESCRIPTION="bustd"
HOMEPAGE="https://github.com/vrmiguel/bustd"
SRC_URI="$(cargo_crate_uris)"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+glob"

QA_FLAGS_IGNORED="usr/bin/bustd"

src_configure() {
	local myfeatures=()
	use glob && myfeatures+=(glob-ignore)
	cargo_src_configure
}

src_install() {
	newinitd "${FILESDIR}/${PN}-init.d" bustd
	newconfd "${FILESDIR}/${PN}-conf.d" bustd
	cargo_src_install
}