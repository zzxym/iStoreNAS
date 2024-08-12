#!/bin/bash

TARGET=$1
case ${TARGET} in
  x86_64)
    ;;
  rk35xx)
    ;;
  rk33xx)
    ;;
  *)
    echo "Please choose target: x86_64 or rk35xx or rk33xx"
    exit 1
    ;;
esac


CURR=`pwd`
mkdir -p dl
mkdir -p ${CURR}/ib_${TARGET}

if [ "$PACK" = "1" ]; then
  docker run -it --rm -u $(id -u):$(id -g) \
    -v ${CURR}:/work \
    -v ${CURR}/ib_${TARGET}:/work/ib \
    -e WORK_TARGET=${TARGET} \
    linkease/runmynas:latest Pack
else
  docker run -it --rm -u $(id -u):$(id -g) \
    -v ${CURR}:/work \
    -v ${CURR}/ib_${TARGET}:/work/ib \
    -e WORK_TARGET=${TARGET} \
    linkease/runmynas:latest
fi

