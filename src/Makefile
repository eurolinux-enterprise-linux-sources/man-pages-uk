#
# This is primary Makefile for manpages-uk project
# http://wiki2man.sourceforge.net
#

#
# This is package version
# 
VERSION = 0.1


#
# This is where to install manpages
#
INSTALLPATH = /usr/share/man

#
# This is language subdirectory in $INSTALLPATH
# See $LANG description in man(1)
#
LANG_SUBDIR = uk

#
# How to compress manpages.
# Known compressors are `none', `gzip', `compress', `bzip2'
#
COMPRESS = gzip

#
# Compressor options
#
COMPRESS_OPTIONS = -9

#
# Compress manpage only if its size is greater than $COMPRESS_SIZE
#
COMPRESS_SIZE = 4096

#
# `install' command
#
INSTALL = install -m 644


all:
	for d in 1 2 3 4 5 6 7 8; do \
		if [ -f man$$d/[Mm]akefile ]; then \
			make -C man$$d all; \
		fi; \
	done

clean:
	for d in 1 2 3 4 5 6 7 8; do \
		if [ -f man$$d/[Mm]akefile ]; then \
			make -C man$$d clean; \
		fi; \
	done

install: install-pages install-aliases

install-pages:
	[ -d $(INSTALLPATH) ] || mkdir -p $(INSTALLPATH)
	[ -d $(INSTALLPATH)/$(LANG_SUBDIR) ] || mkdir $(INSTALLPATH)/$(LANG_SUBDIR)
	if [ x$(COMPRESS) != xgzip -a \
	     x$(COMPRESS) != xbzip2 -a \
	     x$(COMPRESS) != xnone -a \
	     x$(COMPRESS) != xcompress ]; then \
		echo Error: Invalid compressor $(COMPRESS) ; \
		exit 1; \
	fi
	for section in 1 2 3 4 5 6 7 8; do \
		[ -d man$$section ] || continue; \
		[ -d $(INSTALLPATH)/$(LANG_SUBDIR)/man$$section ] || \
			mkdir $(INSTALLPATH)/$(LANG_SUBDIR)/man$$section; \
		cd man$$section; \
		if [ x"`echo *.$$section`" != x\*.$$section ]; then \
			for manpage in *.$$section; do \
				rm -f $(INSTALLPATH)/$(LANG_SUBDIR)/man$$section/$$manpage; \
				for ext in gz Z bz2; do \
					rm -f $(INSTALLPATH)/$(LANG_SUBDIR)/man$$section/$$manpage.$$ext; \
				done; \
				$(INSTALL) $$manpage $(INSTALLPATH)/$(LANG_SUBDIR)/man$$section; \
				FILESIZE=`ls -l $(INSTALLPATH)/$(LANG_SUBDIR)/man$$section/$$manpage | \
					tr -s ' ' | cut -d ' ' -f 5`; \
				if [ $$FILESIZE -gt $(COMPRESS_SIZE) ]; then \
					if [ x$(COMPRESS) != xnone ]; then \
						$(COMPRESS) $(COMPRESS_OPTIONS) $(INSTALLPATH)/$(LANG_SUBDIR)/man$$section/$$manpage; \
					fi; \
				fi; \
			done; \
		fi; \
		cd ..; \
	done

install-aliases:
        for section in 1 2 3 4 5 6 7 8; do \
          [ -d man$$section ] || continue; \
          [ -f man$$section/ALIASES ] || continue; \
          cd man$$section; \
          dest_dir=$(INSTALLPATH)/$(LANG_SUBDIR)/man$$section; \
          sed -e "/^#/d" -e "s,^\(.\+\) \(.\+\)$$,\
            rm -f $$dest_dir/\2.$$section $$dest_dir/\2.$$section.gz \
                $$dest_dir/\2.$$section.Z $$dest_dir/\2.$$section.bz2; \
                echo .so man$$section/\1.$$section \> $$dest_dir/\2.$$section," \
                        < ALIASES > tmp-ukn; \
          . tmp-ukn; \
          rm -f tmp-ukn; \
          cd ..; \
        done
