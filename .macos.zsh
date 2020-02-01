##########################
###     ENVIRONMENT    ###
##########################

XCODE="/Applications/Xcode.app/Contents/Developer"
XTOOLCHAIN="$XCODE/Toolchains/XcodeDefault.xctoolchain"
XPLATFORM="$XCODE/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/"
CELLAR="/usr/local/Cellar"
TK="$XPLATFORM/System/Library/Frameworks/Tk.framework"
LOCAL_IP=$(ifconfig | grep -A 4 "$BROADCAST_INTERFACE" | grep "broadcast" |awk '{print $2}') 

LS_COLORS=""

##########################
###        PATH        ###
##########################

PATH=$PATH:"/Applications/Atom.app/contents/MacOS"
PATH=$PATH:"/Library/Frameworks/Python.framework/Versions/3.4/bin"
PATH=$PATH:"/Library/Tex/Root/bin/x86_64-darwin"
PATH=$PATH:"$CELLAR/binutils/2.27/x86_64-apple-darwin15.6.0/bin" # nm objdump objcopy readelf..
PATH=$PATH:"$CELLAR/reattach-to-user-namespace/2.5/bin"
export PATH
export C_INCLUDE_PATH=$C_INCLUDE_PATH:"$TK/Versions/8.5/Headers"
export BOOST_ROOT="$XPLATFORM/usr/include/boost_1_57_0"
export PYTHONPATH=$PYTHONPATH:"$CELLAR/opencv/2.4.13.1/lib/python2.7/site-packages"

##########################
###       ALIAS        ###
##########################

alias usr="cd $XTOOLCHAIN/usr"              ## C Library
alias include="cd $XPLATFORM/usr/include"   ## C Library
alias cellar="cd $CELLAR"                   ## Cellar
alias cache='cd /Library/Caches'            ## Cache
alias music='cd ~/Music/iTunes/iTunes\ Media/Music'
alias briss='java -jar /Applications/briss-0.9.2/briss-0.9.jar'
alias python='/usr/local/bin/python'
alias sed='/usr/local/bin/gsed'
alias sage='/Applications/SageMath/sage'
