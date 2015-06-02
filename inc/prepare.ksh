downloadit ()
{
	if [ ! -f $COMPONENT_ARCHIVE ]; then
		msg "downloading $COMPONENT_URL:"
		env \"$FETCH_ENV\" fetch $COMPONENT_URL
	else
		msg "already fetched $COMPONENT_URL, skipping"
	fi

	if [ $EXTRA_ARCHIVES_NUM -gt 0 ]; then
		msg "downloading extra archives:"
		curcount=$EXTRA_ARCHIVES_NUM
		while [[ $curcount -gt 0 ]]; do
			if [ ! -f ${COMPONENT_EXTRA_ARCHIVE[$curcount]} ]; then
				msg "fetching ${COMPONENT_EXTRA_URL[$curcount]}:"
				/usr/bin/env \""$FETCH_ENV"\" fetch ${COMPONENT_EXTRA_URL[$curcount]}
			else
				msg "already fetched ${COMPONENT_EXTRA_URL[$curcount]}, skipping"
			fi
			(( curcount -= 1 ))
		done
	fi
}

extractit ()
{
	if [ ! -f $SRC_DIR/.unpacked ]; then
		mkdir -p $SRC_DIR
		msg "extracting $COMPONENT_ARCHIVE:"
		/usr/bin/tar xf $COMPONENT_ARCHIVE ${UNPACK_FLAGS}  && touch $SRC_DIR/.unpacked
	else
		msg "already extracted, skipping"
	fi

	if [ $EXTRA_ARCHIVES_NUM -gt 0 ]; then
		msg "extracting extra archives:"
		curcount=$EXTRA_ARCHIVES_NUM
		while [[ $curcount -gt 0 ]]; do
			if [ ! -f $SRC_DIR/.unpacked.$curcount ]; then
				msg "extracting ${COMPONENT_EXTRA_ARCHIVE[$curcount]}:"
				mkdir -p ${COMPONENT_EXTRA_SRCS[$curcount]}
				/usr/bin/tar xf ${COMPONENT_EXTRA_ARCHIVE[$curcount]} ${EXTRA_UNPACK_FLAGS[$curcount]}  && touch $SRC_DIR/.unpacked.$curcount
			else
				msg "already fetched ${COMPONENT_EXTRA_ARCHIVE[$curcount]}, skipping"
			fi
			(( curcount -= 1 ))
		done
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
