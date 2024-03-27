#
# SPDX-License-Identifier: GPL-3.0-or-later

PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/media-tools
BIN_DIR=$(DESTDIR)$(PREFIX)/bin

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard media-tools/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-media install-doc

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

install-media:

	install -vDm 755 media-tools/audiopic2vid "$(BIN_DIR)/"
	install -vDm 755 media-tools/hflip "$(BIN_DIR)/"
	install -vDm 755 media-tools/hflipvid "$(BIN_DIR)/"
	install -vDm 755 media-tools/ispic "$(BIN_DIR)/"
	install -vDm 755 media-tools/mkaudiovid "$(BIN_DIR)/"
	install -vDm 755 media-tools/mkgif "$(BIN_DIR)/"
	install -vDm 755 media-tools/mkpad "$(BIN_DIR)/"
	install -vDm 755 media-tools/mkvs2webm "$(BIN_DIR)/"
	install -vDm 755 media-tools/opus2ogg "$(BIN_DIR)/"
	install -vDm 755 media-tools/pic2pdf "$(BIN_DIR)/"
	install -vDm 755 media-tools/picscale "$(BIN_DIR)/"
	install -vDm 755 media-tools/picstitch "$(BIN_DIR)/"
	install -vDm 755 media-tools/reverse_logarithmic_presser "$(BIN_DIR)/"
	install -vDm 755 media-tools/stretchpic "$(BIN_DIR)/"
	install -vDm 755 media-tools/vidscale "$(BIN_DIR)/"
	install -vDm 755 media-tools/vidcat "$(BIN_DIR)/"


.PHONY: check install install-doc install-media shellcheck
