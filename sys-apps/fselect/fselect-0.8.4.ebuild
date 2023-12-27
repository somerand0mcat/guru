# Copyright 2001-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	adler@1.0.2
	aes@0.8.2
	ahash@0.8.3
	aho-corasick@1.0.2
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	autocfg@1.1.0
	base64ct@1.6.0
	bitflags@1.3.2
	bitreader@0.3.7
	bitstream-io@1.6.0
	block-buffer@0.10.4
	bumpalo@3.13.0
	bytecount@0.6.3
	byteorder@1.4.3
	bzip2@0.4.4
	bzip2-sys@0.1.11+1.0.8
	cc@1.0.79
	cfg-if@1.0.0
	chrono@0.4.26
	chrono-english@0.1.7
	cipher@0.4.4
	clipboard-win@4.5.0
	constant_time_eq@0.1.5
	core-foundation-sys@0.8.4
	cpufeatures@0.2.8
	crc32fast@1.3.2
	crossbeam-channel@0.5.8
	crossbeam-deque@0.8.3
	crossbeam-epoch@0.9.15
	crossbeam-utils@0.8.16
	crypto-common@0.1.6
	csv@1.2.2
	csv-core@0.1.10
	digest@0.10.7
	directories@5.0.1
	dirs-next@2.0.0
	dirs-sys@0.4.1
	dirs-sys-next@0.1.2
	either@1.8.1
	endian-type@0.1.2
	errno@0.3.1
	errno-dragonfly@0.1.2
	error-code@2.3.1
	fallible_collections@0.4.8
	fd-lock@3.0.12
	fixedbitset@0.4.2
	flate2@1.0.26
	fnv@1.0.7
	generic-array@0.14.7
	getrandom@0.2.10
	hashbrown@0.12.3
	hashbrown@0.13.2
	hermit-abi@0.2.6
	hermit-abi@0.3.1
	hmac@0.12.1
	humansize@2.1.3
	iana-time-zone@0.1.57
	iana-time-zone-haiku@0.1.2
	imagesize@0.12.0
	indexmap@1.9.3
	inout@0.1.3
	io-lifetimes@1.0.11
	itertools@0.10.5
	itoa@1.0.6
	jobserver@0.1.26
	js-sys@0.3.64
	kamadak-exif@0.5.5
	keccak@0.1.4
	lazy_static@1.4.0
	libc@0.2.146
	libm@0.2.7
	libmimalloc-sys@0.1.33
	linux-raw-sys@0.3.8
	log@0.4.19
	lscolors@0.14.0
	matroska@0.25.0
	memchr@2.5.0
	memoffset@0.9.0
	mimalloc@0.1.37
	minimal-lexical@0.2.1
	miniz_oxide@0.7.1
	mp3-metadata@0.3.4
	mp4parse@0.17.0
	mutate_once@0.1.1
	nibble_vec@0.1.0
	nix@0.26.2
	nom@7.1.3
	nu-ansi-term@0.47.0
	nu-ansi-term@0.48.0
	num-traits@0.2.15
	num_cpus@1.15.0
	once_cell@1.18.0
	option-ext@0.2.0
	password-hash@0.4.2
	pbkdf2@0.11.0
	petgraph@0.6.3
	phf@0.11.1
	phf_generator@0.11.1
	phf_macros@0.11.1
	phf_shared@0.11.1
	pkg-config@0.3.27
	ppv-lite86@0.2.17
	proc-macro2@1.0.60
	quote@1.0.28
	radix_trie@0.2.1
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rayon@1.7.0
	rayon-core@1.11.0
	rbase64@2.0.3
	redox_syscall@0.2.16
	redox_users@0.4.3
	regex@1.8.4
	regex-syntax@0.7.2
	rustix@0.37.20
	rustyline@11.0.0
	ryu@1.0.13
	scanlex@0.1.4
	scopeguard@1.1.0
	serde@1.0.164
	serde_derive@1.0.164
	serde_json@1.0.97
	serde_spanned@0.6.2
	sha-1@0.10.1
	sha1@0.10.5
	sha2@0.10.7
	sha3@0.10.8
	siphasher@0.3.10
	smallvec@1.10.0
	static_assertions@1.1.0
	str-buf@1.0.6
	subtle@2.5.0
	svg@0.13.1
	syn@1.0.109
	syn@2.0.18
	thiserror@1.0.40
	thiserror-impl@1.0.40
	time@0.1.45
	time@0.3.22
	time-core@0.1.1
	toml@0.7.4
	toml_datetime@0.6.2
	toml_edit@0.19.10
	tree_magic_db@3.0.0
	tree_magic_mini@3.0.3
	typenum@1.16.0
	unicode-ident@1.0.9
	unicode-segmentation@1.10.1
	unicode-width@0.1.10
	users@0.11.0
	utf8parse@0.2.1
	version_check@0.9.4
	wana_kana@3.0.0
	wasi@0.10.0+wasi-snapshot-preview1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.87
	wasm-bindgen-backend@0.2.87
	wasm-bindgen-macro@0.2.87
	wasm-bindgen-macro-support@0.2.87
	wasm-bindgen-shared@0.2.87
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows@0.48.0
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-targets@0.42.2
	windows-targets@0.48.0
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.0
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.0
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.0
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.0
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.0
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.0
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.0
	winnow@0.4.7
	xattr@1.0.0
	zip@0.6.6
	zstd@0.11.2+zstd.1.5.2
	zstd-safe@5.0.2+zstd.1.5.2
	zstd-sys@2.0.8+zstd.1.5.5
"

inherit cargo

DESCRIPTION="Find files with SQL-like queries"
HOMEPAGE="https://github.com/jhspetersson/fselect"
SRC_URI="
	https://github.com/jhspetersson/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 Boost-1.0 CC0-1.0 MIT MPL-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+users"

QA_FLAGS_IGNORED="/usr/bin/fselect"
DOCS=( README.md docs/usage.md )

src_configure() {
	local myfeatures=(
		$(usev users)
	)
	cargo_src_configure --no-default-features
}

src_compile() {
	cargo_src_compile
}

src_install() {
	cargo_src_install
	doman docs/*.1
	einstalldocs
}