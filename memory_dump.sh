#!/bin/bash 
# Author Andy Lee  2021 11 27 

### export the   enviroment  at first beginning 
export PATH=$(pwd):$PATH
A=`env | grep "PATH" | grep "$(pwd)"`

System_Root=$PWD

if [ "$A" = "" ];then
        echo "enviroment setting fails"
        exit
fi

Memory_Dump_Function()
{
        AVML=amvl
        if [ -f "amvl" ];then
                HASH=$(md5sum $AVML)
                HASH_VERIF=$(echo $(echo $HASH | awk   -F " " '{print ($1)}'  ))
                echo $HASH_VERIF
                if [ "$HASH_VERIF" = "1615a010ae25cf1b947b45a56f57af44" ];then
                        echo "correct file"
                        sudo $PWD/$AVML mem.dmp
                fi
        else
                A=`wget -O $AVML  https://github.com/microsoft/avml/releases/download/v0.3.0/avml`
                chmod 777  $AVML
                sudo $PWD/$AVML mem.dmp
        fi
}

result=$(Memory_Dump_Function)
if [ $? = 0 ];then
        echo "memory dump  success"
fi


if [ ! -d volatility ];then
        echo "not found the volatility folder "
        git clone https://github.com/volatilityfoundation/volatility.git
fi

if [ -d  volatility ]; then
        echo " found the  voloity  folder  plase make the  memory profile "
        cd $System_Root/volatility/tools/linux
        make
        Linux_Version=$(uname -r)
        Debug_Symbol="/boot/System.map-"$Linux_Version
        Target_Zip=$Linux_Version"_"$(date +%s)".zip"
        echo $Boot_Target
        sudo zip  $Target_Zip  ./module.dwarf $Debug_Symbol
        mv $Target_Zip $System_Root/volatility/volatility/plugins/overlays/linux/
fi
