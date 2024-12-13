#!/bin/bash

nom_utilisateur=$

# Vérification de la présence d'arguments
if [ $# -eq 0 ]; then
	echo "il manque les noms d'utilisateurs en argument"
	exit 1
fi

# Traitement des utilisateurs en arguments
for nom_utilisateur in "$@"
do
	# Vérification existence Utilisateur
	if id "$nom_utilisateur" &>/dev/null; then
		echo "L'utilisateur $nom_utilisateur existe déjà"
	else
		# Création de l'utilisateur
		useradd "$nom_utilisateur"

		# Vérification création utilisateur
		if id "$nom_utilisateur" &>/dev/null; then
			echo "l'utilisateur $nom_utilisateur a été créé"
		else
			echo "Erreur à la création de de l'utilisateur $nom_utilisateur"
		fi 
	fi
done
