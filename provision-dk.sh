#/bin/sh
echo '--- Personal'
sudo apt-get install -y keepassx


cd download
echo '--- Install Spideroak'
FILE="deb_x64"
if [ -f $FILE ]; then
   echo "File $FILE exists."
else
   echo "--- Download SpiderOak"
   wget -q https://spideroak.com/release/spideroak/deb_x64
   sudo dpkg -i deb_x64
fi
cd ..
