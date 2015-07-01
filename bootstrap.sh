# sudo su

apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A
echo "deb http://repo.percona.com/apt trusty main" > /etc/apt/sources.list.d/percona.list
echo "deb-src http://repo.percona.com/apt trusty main" >> /etc/apt/sources.list.d/percona.list
apt-get update

apt-get install -y percona-server-tokudb-5.6 # root / root

ps_tokudb_admin --enable -u root -proot
mysql -uroot -proot -e"show engines" # <-- see?

# in /etc/mysql/my.cnf
bind-address=0.0.0.0

service mysql restart

# mysql
GRANT ALL ON *.* to root@'%' IDENTIFIED BY 'root';
flush privileges;

mysql -hIP -uroot -proot
mysql> create database tokudb_test;
