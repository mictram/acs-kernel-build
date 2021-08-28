# acs-kernel-build

## makepkg performance
source: https://wiki.archlinux.org/index.php/Makepkg
```bash
# edit makepkg.conf
vim /etc/makepkg.conf

# edit lines
MAKEFLAGS="-j32"
COMPRESSXZ=(xz -c -z - --threads=0)
```

## steps
source: https://wiki.archlinux.org/index.php/Kernel/Arch_Build_System

```bash
# create build directory
mkdir build
cd build

# get clean kernel pkgbuild
asp update linux
asp export linux

# copy pach files into build/linux/
cp *.patch build/linux/.

# modify PKGBUILD
cd build/linux
vim PKGBUILD

# create custom package name
pkgbase=linux-acs

# add patch names and checksums
source=
sha256sums=

# comment out:
make htmldocs

# patch "pkgname" to remove docs compilation
# pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-docs")
pkgname=("$pkgbase" "$pkgbase-headers")

# intall packages
yay -U linux-acs-5.10.8.arch1-1-x86_64.pkg.tar.zst linux-acs-headers-5.10.8.arch1-1-x86_64.pkg.tar.zst
```

## GRUB configuration
```bash
# add to line GRUB_CMDLINE_LINUX_DEFAULT
GRUB_CMDLINE_LINUX_DEFAULT=" amd_iommu=on iommu=pt pcie_acs_override=downstream,multifunction "
```
