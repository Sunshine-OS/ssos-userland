downloadit ()
{
	if [ ! -f $COMPONENT_ARCHIVE ]; then
		msg "fetching $COMPONENT_URL:"
		fetch $COMPONENT_URL
	else
		msg "already fetched $COMPONENT_URL, skipping"
	fi
}

extractit ()
{
	if [ ! -f $SRC_DIR/.unpacked ]; then
		mkdir -p $SRC_DIR
		msg "extracting $COMPONENT_ARCHIVE:"
		tar xf $COMPONENT_ARCHIVE && touch $SRC_DIR/.unpacked
	else
		msg "already extracted, skipping"
	fi
}

patchit ()
{
	error=0
	if [ ! -f $SRC_DIR/.patched ]; then
		msg "applying patches:"
		for i in patches/*; do
			echo "apply patch $i"
			/usr/bin/patch -p0 -Nfs -d $SRC_DIR < $i || error=1
		done
	
		if [ $error -eq 0 ]; then	
			touch $SRC_DIR/.patched
		else
			err "patching failed"
		fi
	else
		msg "patches already applied, skipping patching"
	fi
}
