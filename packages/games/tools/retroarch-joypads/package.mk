# SPDX-License-Identifier: Apache-2.0
# Copyright (C) 2020-present Fewtarius

PKG_NAME="retroarch-joypads"
PKG_VERSION="948fff0a12e487266eebef14774f17b7b881a728"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/retroarch-joypad-autoconfig"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="RetroArch joypad autoconfigs."
PKG_TOOLCHAIN="manual"

make_target() {
  :
}

makeinstall_target() {
  INSTALLDIR="${INSTALL}/usr/share/libretro/autoconfig"
  mkdir -p ${INSTALLDIR}
  for JOYDIR in linuxraw sdl2 udev x xinput
  do
    cp ${PKG_BUILD}/${JOYDIR}/*cfg ${INSTALLDIR}
  done
  if [ -d "${PKG_DIR}/gamepads/device/${DEVICE}" ]
  then
    cp -r ${PKG_DIR}/gamepads/device/${DEVICE}/* ${INSTALLDIR} ||:
  fi
}

post_install() {
  enable_service tmp-joypads.mount
}