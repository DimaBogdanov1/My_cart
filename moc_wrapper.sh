#!/bin/bash
DYLD_IMAGE_SUFFIX=_debug
export DYLD_IMAGE_SUFFIX
exec /Users/dimabogdanov/Qt/5.15.2/clang_64/bin/moc "$@"
