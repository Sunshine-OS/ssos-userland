configureit ()
{
	CONFIGURE_SCRIPT=$SRC_DIR/configure
	if [ ! -f $BUILD_DIR/.configured ]; then
		mkdir -p $BUILD_DIR
		msg "configuring $COMPONENT:"
		cd $BUILD_DIR
		$CONFIGURE_SCRIPT || err "configure failed"
		touch $BUILD_DIR/.configured
	else
		msg "already configured, skipping"
	fi
}

makeit ()
{
	if [ ! -f $BUILD_DIR/.built ]; then
		msg "building $COMPONENT:"
		cd $BUILD_DIR
		$GMAKE || err "build failed"
		touch $BUILD_DIR/.built
	else
		msg "already built, skipping"
	fi
}

installit ()
{
	if [ ! -f $BUILD_DIR/.installed ]; then
		msg "installing $COMPONENT:"
		cd $BUILD_DIR
		mkdir -p $PROTO_DIR
		$GMAKE install DESTDIR=$PROTO_DIR || err "install failed"
		touch $BUILD_DIR/.installed
	else
		msg "already installed, skipping"
	fi
}
