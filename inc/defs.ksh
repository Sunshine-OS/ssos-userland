#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright (c) 2014 The Sunshine OS Project. All rights reserved.
#

export PATH=/usr/5bin:/usr/ccs/bin:/usr/local/bin::/usr/bin/:/usr/sbin:/sbin:/bin

export LANG=C
export LC_COLLATE=C
export LC_CTYPE=C
export LC_MESSAGES=C
export LC_MONETARY=C
export LC_NUMERIC=C
export LC_TIME=C

MACH=`uname -p`
SHELL=/usr/local/bin/ksh93
COMPILER=clang

WS_COMPONENTS=$USERLAND_WS/components
WS_PKG=$USERLAND_WS/$MACH/pkg
WS_LOG=$USERLAND_WS/$MACH/log

COMPONENT_DIR=`pwd`

SRC_DIR=$COMPONENT_DIR/$COMPONENT_SRCS
BUILD_DIR=$COMPONENT_DIR/build
PROTO_DIR=$BUILD_DIR/proto/$MACH

# base system software
ETCDIR=/etc
USRDIR=/usr
BINDIR=/bin
SBINDIR=/sbin
LIBDIR=/lib
VARDIR=/var

PROTOETCDIR=$PROTO_DIR/etc
PROTOUSRDIR=$PROTO_DIR/usr
PROTOBINDIR=$PROTO_DIR/bin
PROTOSBINDIR=$PROTO_DIR/sbin
PROTOLIBDIR=$PROTO_DIR/lib
PROTOVARDIR=$PROTO_DIR/var

# /usr/local software
LOCALETCDIR=/usr/local/etc
LOCALBINDIR=/usr/local/bin
LOCALSBINDIR=/usr/local/sbin
LOCALLIBDIR=/usr/local/lib

PROTOLOCALETCDIR=$PROTO_DIR/usr/local/etc
PROTOLOCALBINDIR=$PROTO_DIR/usr/local/bin
PROTOLOCALSBINDIR=$PROTO_DIR/usr/local/sbin
PROTOLOCALLIBDIR=$PROTO_DIR/usr/local/lib

# gnu software
GNUETCDIR=/usr/gnu/etc
GNUBINDIR=/usr/gnu/bin
GNUSBINDIR=/usr/gnu/sbin
GNULIBDIR=/usr/gnu/lib

PROTOGNUETCDIR=$PROTO_DIR/usr/gnu/etc
PROTOGNUBINDIR=$PROTO_DIR/usr/gnu/bin
PROTOGNUSBINDIR=$PROTO_DIR/usr/gnu/sbin
PROTOGNULIBDIR=$PROTO_DIR/usr/gnu/lib

BSDMAKE=/usr/bin/make
GMAKE=/usr/local/bin/gmake
PYTHON27=/usr/local/bin/python2.7


