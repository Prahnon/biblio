#!/bin/bash

$update=$(apt update)
$update

apt install openjdk-11-jdk -y

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -

sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

$update

apt install jenkins -y

service jenkins start

$mdpadminjenkins=$(cat /var/lib/jenkins/secrets/initialAdminPassword)
echo "Voici le mot de passe admin pour débloquer l'outil Jenkins : " $mdpadminjenkins

ip a

echo "Rendez-vous sur la page suivante : AdresseIpDeLaMachine:8080
      Renseignez le mot de passe"

echo "Une fois le mot de passe renseigné, choississez INSTALLER LES PLUGINS SUGGEREES"

echo "Après l'installation des plugins, créer votre propre utilisateur de jenkins"

echo "Dans la page de CONFIGURATION DE L'INSTANCE, changer l'url si celui-ci n'est pas correct"
