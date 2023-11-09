#!/bin/sh
DOCKER_IMAGE=$1
DOCKER_RUN="docker run --rm -i -v $(pwd):/local -w /local ${DOCKER_IMAGE}"

CMD="agda --compile hello-world.agda >/dev/null 2>&1 && ./hello-world"
RESULT="$(${DOCKER_RUN} sh -c "${CMD}")"
echo "${RESULT}"
rm -rf hello-world.agdai MAlanzo
if [ "${RESULT}" = "Hello, world!" ]
then
    echo "PASSED"
else
    echo "FAILED"
    exit 1
fi
