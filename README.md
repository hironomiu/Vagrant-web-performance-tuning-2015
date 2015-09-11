Vagrant-web-performance-tuning-2015用環境
===================================

注意：仮想環境のメモリは768M以上で設定

## Provision 
Puppet  
Shell

## Set Up
### git clone
```
$ git clone git@github.com:hironomiu/Vagrant-web-performance-tuning-2015.gite
```
### vagrant up
```
$ cd Vagrant-web-performance-tuning-2015 
$ vagrant up  
```
## Login
### demouser
```
$ ssh demouser@192.168.56.7
$ su -
 pass vagrant
```
### vagrant
```
$ vagrant ssh
```
## users

| OS user | pass | 続DB | 接続Port |  DB user |  DB pass | 用途 |
|:-----------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|
| root | vagrant | - | 3306 |  root | vagrant | root |
| vagrant | vagrant | - | - | - | - | vagrant用ユーザ |
| demouser | demouser | groupwork | 3306 | demouser | demopass | 検証用ユーザ |

## Packages   
### mysql
自動起動
/etc/my.cnf  
### iptables
自動起動
port22,80 allow
### httpd
自動起動
/etc/httpd/conf/httpd.conf

