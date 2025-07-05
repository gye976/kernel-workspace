set_kernel_tree() {
	if [ ! -z "${TARGET}" ]; then
		return 0
	fi

	if [ ! "$#" -eq 1 ]; then
		echo "arg cnt err" >&2
		exit 1
	fi

	if [ "$1" = "mainline" ]; then
		TARGET="mainline"
		LINUX="linux"
		OUTPUT="output"
	else 
		TARGET="$1"
		LINUX="linux-$1"
		OUTPUT="output-$1"

		if [ ! -d "$LINUX" ]; then
			echo "invalide linux dir, ${LINUX}" >&2
			exit 1
		fi
	fi

	export TARGET
	export LINUX
	export OUTPUT

	echo "${TARGET}"

	return 0
}
