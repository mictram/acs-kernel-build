prepare:
	asp update build
	asp export build

build:
	cd build; \
		makepkg

clean:
	rm -rf build
