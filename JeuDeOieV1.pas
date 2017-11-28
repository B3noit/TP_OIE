PROGRAM Jeu_oie;

USES crt;

//ALGO: JeuDeOIe
//BUT : Créer un jeu de l'oie dans lequel le joueur entre les résultats de son dé, le joueur gagne lorsqu'il atteint la case 66,
//		à l'exception de la case 63 qaund le joueur tombe dur une case multiple de 9, le joueur avance à nouveau de même nomb res de cases,
//		enfin, si le joueur tombe sur la case 58, il recommence.
//Entrées : Les résultats de chaque lancé de dé.
//Sorties : La case sur laquelle se trouve le joueur, mais aussi les informations complémentaire pour que le joueur ne soit pas perdu
//										(les cases multiples de 9, la case 58, quand le joueur à gagner, si il recul car il avance trop.)

{
VAR
alea,place,cptde,deplacement : ENTIER


DEBUT
//Bloc d initialisation
place:=0;
deplacement:=0;
alea:=0;
place:=0;
cptde:=1;

ECRIRE "Bienvenue dans le jeu del'oie!"

REPETER

	
	REPETER	
		ECRIRE "Premier lancé de dé ! ( Saisissez votre resultat,)"
		LIRE alea
		SI (alea<1) OU (alea>6) ALORS
			ECRIRE alea & "n'est pas un nombre valide! Vous n'essayez tout de même pas de tricher! "
		FIN SI
	JUSQU'A (alea>0) et (alea<7)																			 //Pour mon lancé de dé j'avais d'abord utilisé une boucle POUR qui se répète 2 fois mais
					                                                                                         // utilisé deux boucles différentes me permet d'économiser la variable du compteur, de plus   
					     																					 // je peux peux varier les phrases énoncées au joueur et cela me paraît plus claire.	

								
	ECRIRE "Le premier lancer de dé a fait : " & alea 

	deplacement<--alea


	REPETER	
		ECRIRE "Second lancé de dé ! ( Saisissez votre resultat)"
		LIRE alea
		SI (alea<1) OU (alea>6) ALORS
			ECRIRE alea & "n'est pas un nombre valide! Vous n'essayez tout de même pas de tricher! "
		FIN SI
	JUSQU'A (alea>0) et (alea<7)


	ECRIRE "Le second lancer de dé a fait : " & alea

	deplacement<--deplacement + alea 

	ECRIRE "Vous vous déplacez donc de " & deplacement & " cases"


	SI (place + deplacement > 66 ) ALORS
		ECRIRE "Vous y étiez presque, mais " & deplacement & " c'est trop, vous atteignez la case 66 mais reculez de " & (place + deplacement - 66)
		place<--(66-(place+deplacement-66))
	SINON place<--place + deplacement
	FIN SI


	TANT QUE (place MOD 9 =0) ET (place <63) FAIRE
		ECRIRE "Bravo ! Vous etes tombe pile sur une oie ! Vous avancez  a nouveau de " & deplacement & " cases"
		place<--place + deplacement
		ECRIRE "WAHOU ! Vous êtes sur la case " & place & " ."
	FIN TANT QUE


	SI (place=58) ALORS
		ECRIRE "Oh non ! Vous etes tombe sur la case 58, malheuresement vous retourne a la case depart."
		place<--0
	FIN SI


	ECRIRE "Vous êtes sur la case : " & place


JUSQU'A (place=66)

ECRIRE "BRAVO ! Vous avez gagneé!"

FIN}


VAR
alea,place,cptde,deplacement : INTEGER;

BEGIN
//Bloc d initialisation
place:=0;
deplacement:=0;
alea:=0;
place:=0;
cptde:=1;

	clrscr;
	
	writeln('Bienvenue dans le jeu de l oie !');

Repeat
	begin

		clrscr;

		Repeat
			begin
		writeln('Premier lance de de ! (entrez le resultat de votre de)');
		readln (alea) ;
				if((alea<1)or(alea>6))then
					begin
					writeln(alea,' n est pas un nombre valide! Vous n essayez tout de meme pas de tricher.');    //Pour mon lancé de dé j'avais d'abord utilisé une boucle POUR qui se répète 2 fois mais
					end;                                                                                         // utilisé deux boucles différentes me permet d'économiser la variable du compteur, de plus   
			end;		     																					 // je peux peux varier les phrases énoncées au joueur et cela me paraît plus claire.	
		until ((alea>0)and(alea<7));
		

		writeln('Le premier lancer de de a fait : ',alea);


		deplacement:=alea;

		Repeat
			begin
		writeln('Second lance de de ! (entrez le resultat de votre de)');
		readln (alea) ;
				if((alea<1)or(alea>6))then
					begin
					writeln(alea,' n est pas un nombre valide! Vous n essayez tout de meme pas de tricher.');
					end;
			end;
		until ((alea>0)and(alea<7));
		
		writeln('Le second lancer de de a fait : ',alea);

		deplacement:=deplacement+alea;

		writeln('Vous vous deplacez donc d un total de : ',deplacement,' cases.');



		if (place+deplacement>66) then
			begin
				writeln('Vous y etiez presque, mais ',deplacement,' c est trop, vous atteignez la case 66 mais reculez de ',(place+deplacement-66));
				place:=(66-(place+deplacement-66));
			end
		else
			begin
				place:=place+deplacement;
			end;


			while ((place MOD 9 =0) and (place<63))do//Le joueur peut aussi tombé sur la case 72 avant que le retout en arrière soit traiter donc la place doit être inferieur à 72
				begin
					writeln('Bravo ! Vous etes tombe pile sur une oie ! Vous avancez  a nouveau de ',deplacement,' cases');
					place:=place+deplacement;
					writeln('WAOUH! Vous etes sur la case ',place,' .');
				end;

	
		if (place=58) then
			begin
				writeln('Oh non ! Vous etes tombe sur la case 58, malheuresement vous retourne a la case depart.');
				place:=0
			end;
		
			
			writeln('Vous etes sur la case ',place,' .');
			readkey;


end;
until place=66;

	writeln('OH MON DIEU MAIS VOUS AVEZ GAGNE !!!!!');

	readkey;

END.