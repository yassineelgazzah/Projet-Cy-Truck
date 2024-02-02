# Projet-Cy-Truck

Ce logiciel comprend à la fois des composants de programmation Shell et C. Son objectif principal est d'exécuter diverses fonctions facilitant le tri d'un fichier de données contenant diverses informations, telles que les noms des conducteurs, les trajets, les distances et les différentes étapes du trajet.

Le programme est spécifiquement conçu pour répondre aux besoins des entreprises de transport ou de logistique.
Il propose cinq exécutions distinctes, chacune aboutissant à l'affichage d'un graphique :

1. **Top 10 des conducteurs ayant effectué les trajets les plus longs :**
    - Commande : bash d1.sh
    - Graphique : Affiche les dix conducteurs ayant effectué les trajets les plus longs, triés par ordre décroissant selon le nombre de trajets.

2. **Top 10 des conducteurs avec les plus longues distances :**
    - Commande : bash d2.sh
    - Graphique : Illustre les dix premiers conducteurs ayant parcouru les plus longues distances, triés par ordre décroissant.

3. **10 voyages les plus longs :**
    - Commande : bash l.sh
    - Graphique : représente les dix trajets les plus longs avec l'identifiant du trajet sur l'axe des x et la distance en kilomètres sur l'axe des y.

4. **Top 10 des villes avec le plus de traversées :**
    - Commande : gcc -o tr-t tr-t.c
                bash t.sh
    - Graphique : affiche les dix premières villes avec le plus grand nombre de traversées, classées par ordre alphabétique.

5. **Statistiques sur les étapes du voyage :**
    - Commande : gcc -o trai-s trai-s.c
                bash s.sh
    - Graphique : fournit des informations statistiques sur les étapes du voyage, y compris les distances minimales, maximales et moyennes. Un graphique courbe illustre les tendances des distances minimales, maximales et moyennes pour chaque étape de chaque voyage.

Il ne faut pas oublier de télécharger le fichier data.csv qui contient l’ensemble des données de trajets routiers des camions.
