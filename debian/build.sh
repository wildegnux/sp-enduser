build() {
	make
}

package() {
	make DESTDIR="$pkgdir" install
}
