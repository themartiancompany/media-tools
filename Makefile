# SPDX-License-Identifier: AGPL-3.0-or-later

_PROJECT=media-tools
PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/$(_PROJECT)
BIN_DIR=$(DESTDIR)$(PREFIX)/bin
DATA_DIR=$(DESTDIR)$(PREFIX)/share/$(_PROJECT)

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard $(_PROJECT)/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-media install-configs install-doc

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

install-media:

	install -vdm 755 "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/addfade "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/addsilence "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/audiocat "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/audiopic2vid "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/audioverlap "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/blackintro "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/blackoutro "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/blackvid "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/crop "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/fluidreverseloop "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/gridcrop "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/hflip "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/hflipvid "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/ispic "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/mediaclip "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/medialength "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/mediasplit "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/mediareverse "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/mkmedia "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/mkaudioloop "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/mkgif "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/mkpad "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/mkvs2webm "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/opus2ogg "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/pic2pdf "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/pic2ascii "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/pic2txt "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/picscale "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/picstitch "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/reverse_logarithmic_presser "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/stretchpic "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/txt2pic "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/vidcat "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/vidmute "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/vidrotate "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/vidscale "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/vidstack "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/vidsize "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/volumechange "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/ytxclip "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/ytencode "$(BIN_DIR)"
	install -vDm 755 $(_PROJECT)/zoompan "$(BIN_DIR)"

install-configs:

	install -vdm 755 "$(DATA_DIR)/configs"
	install -vDm 755 configs/ffmpeg_options "$(DATA_DIR)/configs"

.PHONY: check install install-configs install-doc install-media shellcheck
