#!/bin/sh
(cd codec/decoder && python ../../build/mktargets.py --directory codec/decoder --library decoder --exclude StdAfx.cpp)
(cd codec/encoder && python ../../build/mktargets.py --directory codec/encoder --library encoder --exclude DllEntry.cpp)
(cd codec/common && python ../../build/mktargets.py --directory codec/common --library common)
(cd codec/processing && python ../../build/mktargets.py --directory codec/processing --library processing)

(cd codec/console/dec && python ../../../build/mktargets.py --directory codec/console/dec --binary h264dec)
(cd codec/console/enc && python ../../../build/mktargets.py --directory codec/console/enc --binary h264enc)
(cd test && python ../build/mktargets.py --directory test --binary codec_unittest)
(cd gtest && python ../build/mktargets.py --directory gtest --library gtest --out ../build/gtest-targets.mk --cpp-suffix .cc --include gtest-all.cc)
