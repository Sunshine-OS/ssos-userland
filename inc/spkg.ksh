PKGTEMP=/var/tmp

genpkginfo ()
{
	cp pkginfo.in pkginfo
	eval "${SEDINPLACE} 's/%NAME/${COMPONENT_PKGNAME}/g' pkginfo"
	eval "${SEDINPLACE} 's/%VER/${COMPONENT_VERSION}/g' pkginfo"
	eval "${SEDINPLACE} 's/%MACH/${MACH}/g' pkginfo"
	eval "${SEDINPLACE} 's/%BUILD/${BUILD}/g' pkginfo"
}

genpkgproto ()
{
	rm pkgproto
	(cd $PROTO_DIR && find . -print | pkgproto) | >>pkgproto sed 's:^\([df] [^ ]* [^ ]* [^ ]*\) .*:\1 root wheel:; s:^f\( [^ ]* etc/\):v \1:; s:^f\( [^ ]* var/\):v \1:; s:^\(s [^ ]* [^ ]*=\)\([^/]\):\1./\2:'
}

genpkg ()
{
	echo "i pkginfo" >> pkgproto
	pkgmk -a $MACH -d $PKGTEMP -r $PROTO_DIR -f pkgproto
	mkdir -p $WS_PKG
	pkgtrans -o -s $PKGTEMP $WS_PKG/$COMPONENT_PKGNAME.pkg $COMPONENT_PKGNAME
}
