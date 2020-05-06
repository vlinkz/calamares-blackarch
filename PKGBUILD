pkgname=calamares
pkgver=3.2.21
pkgrel=1
pkgdesc='Distribution-independent installer framework'
arch=('x86_64')
license=(GPL)
url="https://github.com/calamares/calamares/releases/download"
license=('LGPL')
depends=('kconfig' 'kcoreaddons' 'kiconthemes' 'ki18n' 'kio' 'solid' 'yaml-cpp' 'kpmcore'
         'boost-libs' 'kparts' #'ckbcomp'
         'hwinfo' 'qt5-svg' 'polkit-qt5' 'gtk-update-icon-cache' 'plasma-framework'
         'qt5-xmlpatterns' 'qt5-svg' 'qt5-styleplugins' 'squashfs-tools' 'libpwquality')
makedepends=('extra-cmake-modules' 'qt5-tools' 'qt5-translations' 'git' 'boost')

source+=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/v$pkgver/calamares-$pkgver.tar.gz"
        )
sha256sums=('59879375ab4e070dc127237e9dba4c96620e4445c8ceb3d4cf44bd31b091840f')

prepare() {
	cd ${srcdir}/calamares-${pkgver}
	sed -i -e 's/"Install configuration files" OFF/"Install configuration files" ON/' CMakeLists.txt
}

build() {
	cd ${srcdir}/calamares-${pkgver}

	mkdir -p build
	cd build
        cmake .. \
              -DCMAKE_BUILD_TYPE=Release \
              -DCMAKE_INSTALL_PREFIX=/usr \
              -DCMAKE_INSTALL_LIBDIR=lib \
              -DWITH_PYTHONQT:BOOL=ON \
              -DBoost_NO_BOOST_CMAKE=ON \
              -DSKIP_MODULES="tracking webview interactiveterminal initramfs \
                              initramfscfg dracut dracutlukscfg \
                              dummyprocess dummypython dummycpp \
                              dummypythonqt services-openrc"
        make
}

package() {
	cd ${srcdir}/calamares-${pkgver}/build
	make DESTDIR="$pkgdir" install
	#install -Dm644 "../data/blackarch-icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/calamares.svg"
        install -Dm644 "$srcdir/calamares-autostart.desktop" "$pkgdir/etc/xdg/autostart/calamares-autostart.desktop"
	install -Dm644 "$srcdir/calamares.desktop" "$pkgdir/usr/share/applications/calamares.desktop"
	install -Dm644 "$srcdir/49-nopasswd-calamares.rules" "$pkgdir/etc/polkit-1/rules.d/49-nopasswd-calamares.rules"
	chmod 750      "$pkgdir"/etc/polkit-1/rules.d
        mkdir -p "$pkgdir/etc"
        cp -R "$srcdir/etc/calamares" "$pkgdir/etc/calamares"
        cp -R "$srcdir/usr/lib/calamares/modules/localrepo" "$pkgdir/usr/lib/calamares/modules/localrepo"
        cp -R "$srcdir/usr/lib/calamares/modules/localrepopost" "$pkgdir/usr/lib/calamares/modules/localrepopost"
}
