# SPDX-License-Identifier: AGPL-3.0-or-later

PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/media-tools
BIN_DIR=$(DESTDIR)$(PREFIX)/bin
DATA_DIR=$(DESTDIR)$(PREFIX)/share/media-tools

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard media-tools/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-media install-configs install-doc

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

install-media:

	install -vdm 755 "$(BIN_DIR)"
	install -vDm 755 media-tools/addfade "$(BIN_DIR)"
	install -vDm 755 media-tools/addsilence "$(BIN_DIR)"
	install -vDm 755 media-tools/audiocat "$(BIN_DIR)"
	install -vDm 755 media-tools/audiopic2vid "$(BIN_DIR)"
	install -vDm 755 media-tools/audioverlap "$(BIN_DIR)"
	install -vDm 755 media-tools/blackintro "$(BIN_DIR)"
	install -vDm 755 media-tools/blackoutro "$(BIN_DIR)"
	install -vDm 755 media-tools/blackvid "$(BIN_DIR)"
	install -vDm 755 media-tools/crop "$(BIN_DIR)"
	install -vDm 755 media-tools/gridcrop "$(BIN_DIR)"
	install -vDm 755 media-tools/hflip "$(BIN_DIR)"
	install -vDm 755 media-tools/hflipvid "$(BIN_DIR)"
	install -vDm 755 media-tools/ispic "$(BIN_DIR)"
	install -vDm 755 media-tools/mediaclip "$(BIN_DIR)"
	install -vDm 755 media-tools/medialength "$(BIN_DIR)"
	install -vDm 755 media-tools/mediasplit "$(BIN_DIR)"
	install -vDm 755 media-tools/mkmedia "$(BIN_DIR)"
	install -vDm 755 media-tools/mkaudioloop "$(BIN_DIR)"
	install -vDm 755 media-tools/mkgif "$(BIN_DIR)"
	install -vDm 755 media-tools/mkpad "$(BIN_DIR)"
	install -vDm 755 media-tools/mkvs2webm "$(BIN_DIR)"
	install -vDm 755 media-tools/opus2ogg "$(BIN_DIR)"
	install -vDm 755 media-tools/pic2pdf "$(BIN_DIR)"
	install -vDm 755 media-tools/picscale "$(BIN_DIR)"
	install -vDm 755 media-tools/picstitch "$(BIN_DIR)"
	install -vDm 755 media-tools/reverse_logarithmic_presser "$(BIN_DIR)"
	install -vDm 755 media-tools/stretchpic "$(BIN_DIR)"
	install -vDm 755 media-tools/vidrotate "$(BIN_DIR)"
	install -vDm 755 media-tools/vidscale "$(BIN_DIR)"
	install -vDm 755 media-tools/vidcat "$(BIN_DIR)"
	install -vDm 755 media-tools/vidmute "$(BIN_DIR)"
	install -vDm 755 media-tools/vidsize "$(BIN_DIR)"
	install -vDm 755 media-tools/volumechange "$(BIN_DIR)"
	install -vDm 755 media-tools/ytxclip "$(BIN_DIR)"
	install -vDm 755 media-tools/ytencode "$(BIN_DIR)"
	install -vDm 755 media-tools/zoompan "$(BIN_DIR)"

install-configs:

	install -vdm 755 "$(DATA_DIR)/configs"
	install -vDm 755 configs/ffmpeg_options "$(DATA_DIR)/configs"

.PHONY: check install install-configs install-doc install-media shellcheck
