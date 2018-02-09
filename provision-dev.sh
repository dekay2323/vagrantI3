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
wget https://download.jetbrains.com/idea/ideaIU-2017.3.4-no-jdk.tar.gz
tar xfz ideaIU-2017.3.4-no-jdk.tar.gz
