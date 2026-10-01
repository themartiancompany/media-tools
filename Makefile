# SPDX-License-Identifier: AGPL-3.0

#    -----------------------------------------------------
#    Copyright © 2023, 2024, 2025, 2026
#                Pellegrino Prevete
#
#    All rights reserved
#    -----------------------------------------------------
#
#    This program is free software: you can redistribute
#    it and/or modify it under the terms of the
#    GNU Affero General Public License as published by
#    the Free Software Foundation, either version 3 of
#    the License, or (at your option) any later version.
#
#    This program is distributed in the hope that it
#    will be useful, but WITHOUT ANY WARRANTY;
#    without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#    See the GNU Affero General Public License for
#    more details.
#
#    You should have received a copy of the
#    GNU Affero General Public License
#    along with this program.
#    If not, see <https://www.gnu.org/licenses/>.

SHELL = bash
_PROJECT=media-tools
PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/$(_PROJECT)
BIN_DIR=$(DESTDIR)$(PREFIX)/bin
DATA_DIR=$(DESTDIR)$(PREFIX)/share/$(_PROJECT)

_INSTALL_FILE=\
  install \
    -vDm644
_INSTALL_DIR=\
  install \
    -vdm755
_INSTALL_EXE=\
  install \
    -vDm755
_MAKE_EXE=\
  chmod \
    755
_MAKE_LINK=\
  ln \
    -sv

DOC_FILES=\
  $(wildcard \
      *.rst)
SCRIPT_FILES=\
  $(wildcard \
      $(_PROJECT)/*)

all:

check: shellcheck

shellcheck:

	shellcheck \
	  -s \
	    "bash" \
	  $(SCRIPT_FILES)

install: install-media install-configs install-doc

install-doc:

	$(_INSTALL_FILE) \
	  $(DOC_FILES) \
	  -t \
	  $(DOC_DIR)

install-media:

	$(_INSTALL_DIR) \
	  "$(BIN_DIR)"
	for _file \
	  in $(SCRIPT_FILES); do \
	  $(_INSTALL_EXE) \
	    "$(_PROJECT)/$${_file}" \
	    "$(BIN_DIR)/$${_file}"; \
	done
	$(_MAKE_LINK) \
	  "$(PREFIX)/bin/audiopic2vid" \
	  "$(BIN_DIR)/mkslideshow" || \
	true
	$(_MAKE_LINK) \
	  "$(PREFIX)/bin/mediasize" \
	  "$(BIN_DIR)/vidsize" || \
	true

install-configs:

	$(_INSTALL_DIR) \
	  "$(DATA_DIR)/configs"
	$(_INSTALL_FILE) \
	  "configs/ffmpeg_options" \
	  "$(DATA_DIR)/configs"

uninstall-media:

	for _file \
	  in $(SCRIPT_FILES); do \
	  rm \
	    -vrf \
	    "$(BIN_DIR)/$${_file}"; \
	done

.PHONY: check install install-configs install-doc install-media shellcheck uninstall-media
