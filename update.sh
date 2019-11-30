mainURL="/data-disk/ai2-server/"
cd ${mainURL}
git clone https://github.com/mit-cml/appinventor-sources.git
dataname=appinventor-sources-$(date +"%Y%m%d")
mv appinventor-sources ${dataname}
chmod 777 ${dataname} -R
cd ${dataname}
git submodule update --init
cd appinventor
ant MakeAuthkey
ant

cd ${mainURL}
javaSDKPath=`python3 update/getJavaURL.py` # | awk -F'/' '{print $6}'
javaSDKname=`echo ${javaSDKPath} | awk -F'/' '{print $6}'`
wget ${javaSDKPath}
unzip -o ${javaSDKname}
rm ${javaSDKname}
chmod 777 `echo ${javaSDKname%%.zip}` -R

for pid in `ps aux | grep "ai2" | awk -F' ' '{print $2}'`
do
    sudo kill $pid
done

nohup /data-disk/ai2-server/${javaSDKname%%.zip}/bin/dev_appserver.sh -p 8888 -a 0.0.0.0 /data-disk/ai2-server/${dataname}/appinventor/appengine/build/war/ & > AllSource/ai2server.log

cd ${mainURL}/${dataname}/appinventor/buildserver
nohup ant RunLocalBuildServer & > AllSource/ai2build.log
sleep 7
echo "完成"
