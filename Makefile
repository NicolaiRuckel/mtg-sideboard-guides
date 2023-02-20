SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

LATEXMK=latexmk

OUT=out

DECKS=$(wildcard deck-*.tex)

.PHONY: all
all: $(addprefix out/, $(DECKS:.tex=.pdf))

$(OUT)/%.pdf: %.tex
	$(LATEXMK) $<

.PHONY: clean
clean:
	rm -rf $(OUT)/*
