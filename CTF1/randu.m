% Auteur : Arnaud Meauzoone

NB = 10000;	% Le nombre de points que l'on souhaite créer.
		% En dessous de 1000 on ne voit pas grand chose

Px = []; % On crée une liste pour contenir les coordonnées x des points.
Py = []; % On crée une liste pour contenir les coordonnées y des points.
Pz = []; % On crée une liste pour contenir les coordonnées z des points.

seed = 1; % On prend une graine, ici vous pouvez mettre ce que vous voulez.

prec = seed; % Ici on initialise le précédent avec la graine.

for i = 1:NB;	% On boucle pour créer les points. Si on veut 10000 points il faut
		% 3 fois plus de points car chaque point va devenir une coordonnée.

  Px = [Px,prec/2**31];

  prec = mod(65539*prec, 2**31);

  Py = [Py,prec/2**31];

  prec = mod(65539*prec, 2**31);

  Pz = [Pz,prec/2**31];

  prec = mod(65539*prec, 2**31);

endfor

plot3(Px,Py,Pz, ".") % On affiche le résultat.
