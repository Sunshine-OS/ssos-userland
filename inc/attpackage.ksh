makeit ()
{
	if [ ! -f $BUILD_DIR/.built ]; then
		msg "building $COMPONENT:"
		# check if clean flag?
		#rm -rf $BUILD_DIR; mkdir -p $BUILD_DIR
		#$CLONEY $PWD/$COMPONENT_SRCS $BUILD_DIR
		cd $BUILD_DIR; echo $PWD; bin/package make || err "build failed"
		#$GMAKE || err "build failed"
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
		bin/package flat install $PROTO_DIR $COMPONENT_INSTALL_PACKAGES || err "install failed"
		touch $BUILD_DIR/.installed
	else
		msg "already installed, skipping"
	fi
}
