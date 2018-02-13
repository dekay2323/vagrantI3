#/bin/sh
echo '--- Development'
sudo apt-get install -y git tig gradle maven groovy

echo '--- Java'
sudo apt-get install -y software-properties-common python-software-properties
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
sudo apt-get install oracle-java8-installer
echo "Setting environment variables for Java 8.."
sudo apt-get install -y oracle-java8-set-default

echo '-- Intellij'
cd development
FILE="deb_x64"
if [ -f $FILE ]; then
   echo "File $FILE exists."
else
   echo "--- Download Intellij"
   wget -q https://download.jetbrains.com/idea/ideaIU-2017.3.4-no-jdk.tar.gz
   tar xfz ideaIU-2017.3.4-no-jdk.tar.gz
   sudo mv idea-IU-173.4548.28/ /opt/idea
   sudo ln -s /opt/idea/bin/idea.sh /bin/idea
fi
cp /home/vagrant/intellijSettings.jar "${userhome}/download/"
cd ..

echo '--- Git User'
git config --global core.precomposeunicode true
git config --global user.name "Demian Krige"
git config --global user.email demian.krige@stratahealth.com
ssh-keygen -t rsa -C "demian.krige@stratahealth.com" -q -P ""
