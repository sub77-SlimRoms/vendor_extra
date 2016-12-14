# CCACHE
export USE_CCACHE=1
export CCACHE_DIR=./ccache
ccache -M 15G

# COLORS
BUILD_WITH_COLORS=1
if [ ! "$BUILD_WITH_COLORS" = "0" ]; then
    CL_RED="\033[31m"
    CL_GRN="\033[32m"
    CL_YLW="\033[33m"
    CL_BLU="\033[34m"
    CL_MAG="\033[35m"
    CL_CYN="\033[36m"
    CL_RST="\033[0m"
fi

#PATCHING COMMON
for f in `test -d vendor && find -L vendor/extra/products/common/patch -maxdepth 1 -name 'apply.sh' 2> /dev/null`
do
    echo " "
    echo "Patching common-tree -> $f"
    echo " "
    . $f
done
unset f

# PATCHING DEVICE
function patchdevicetree()
{
for f in `test -d device && find -L device/$SLIM_BUILD/patch -maxdepth 4 -name 'apply.sh' 2> /dev/null`
do
    echo "Patching device-tree -> $f"
    echo " "
    . $f
done
unset f
}

function set_stuff_for_environment()
{
    settitle
    set_java_home
    setpaths
    set_sequence_number
    patchdevicetree

    export ANDROID_BUILD_TOP=$(gettop)
    # With this environment variable new GCC can apply colors to warnings/errors
    export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
    export ASAN_OPTIONS=detect_leaks=0
}


