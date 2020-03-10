##
## Install gcn2scimma
##
INSTALL_DIR   := /usr/local/gcn2scimma
PYTHON_FILES  := gcn2scimma Utils.py 
INSTALL_FILES := $(patsubst %,$(INSTALL_DIR)/%,$(PYTHON_FILES))

.PHONY: all install install_dir

all:
	@echo No default make command. To install run "make install"

install_dir:
	mkdir -p $(INSTALL_DIR)

$(INSTALL_DIR)/%: %
	cp $< $@
	chmod ugo+rx $@

install: install_dir $(INSTALL_FILES)

print-%  : ; @echo $* = $($*)

test:
	cd test && pytest -v

clean:
	rm -f *~
	rm -rf __pycache__