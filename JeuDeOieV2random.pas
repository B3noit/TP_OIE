PROGRAM Jeu_oie;

USES crt;

//ALGO:JeuDeOIe
//BUT : Créer un jeu de l'oie dans lequel le joueur appuie sur la touche entrée pour simuler un lancé qui le fait avancer, le joueur gagne lorsqu'il atteint la case 66,
//		à l'exception de la case 63 qaund le joueur tombe dur une case multiple de 9, le joueur avance à nouveau de même nomb res de cases,
//		enfin, si le joueur tombe sur la case 58, il recommence.
//Entrées : La pression sur la touche entrée est nécessaire pour faire avancé le jeu.
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

	
		
	ECRIRE "Premier lancé de dé ! ( appuyez sur entrée pour lancer le dé)"
	alea<--ALEATOIRE 1 à 6
	
	ECRIRE "Le premier lancer de dé a fait : " & alea 

	deplacement<--alea


		ECRIRE "Second lancé de dé ! ( appuyez sur entrée pour lancer le dé)"
		alea<--ALEATOIRE 1 à 6

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

{DEBUT

ECRIRE "Premier lancé de dé ! ( appuyez sur entrée pour lancer le dé)""
LIRE }


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

		writeln('Premier lance de de ! (appuyez sur entree pour lancer le de)');
		readln ;
		randomize ;
		alea := random(6)+1 ;//Le random de base commence a 0, on doit donc jouer le random sur 5 puis ajouter 1 pour simuler le lancer d un de
		writeln('Le premier lancer de de a fait : ',alea);

		deplacement:=alea;

		writeln('Second lance de de ! (appuyez sur entree pour lancer le de)');
		readln;
		alea := random(6)+1 ;
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
