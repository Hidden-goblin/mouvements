package assets 
{
		import flash.display.Shape;
		import mx.effects.Tween;
		import assets.*;
		
		public class Translations extends Shape
		{
		//Variables de classe	
			private var taille:int;
			private var vitesseTrain:Number = 0;
			private var vitesseScooter:Number = 0;
			private var vitesseBalle:Number = 0;
			private var referentiel:String = 'sol';// Ne doit prendre que les valeurs sol, scooter et train
			private var tempsAnimation:Number = 30000;
			private var vitesseAnimation:Number = 500;
			private var departPosition:Object = {train:275,balle:440,scooter:360,perso:380};
			private var mouvement:Tween;
			// Les éléments de l'animation
			private var laBalle:Bille = new Bille(5);
			private var leTrain:Train = new Train(190,60);
			private var persoTrainG:Personnage=new Personnage(true);
			private var persoSol:Personnage=new Personnage(true);
			private var persoTrainD:Personnage=new Personnage(false);
			private var leScooter:Scooter=new Scooter();
			//Positionnement des éléments sur la base d'un 800x250
			/*****************************************************
			 private var depart:ArrayCollection = new ArrayCollection([{'laBalleX':440,'trainX':275,'scooterX':360,'personnageSol':380},
			{'vitesseBalle':0,'vitesseTrain':0,'vitesseScooter':0},{'messageBalle' : "La vitesse est de 0 km/h",'messageTrain' : "La vitesse est de 0 km/h",
			'messageScooter' : "La vitesse est de 0 km/h"}]);
			
			train.Y=0, personnagesTrain.Y=15, balleTrain.Y=23, trait séparation.Y=81, scooter.Y=90, personnageSol.Y=150
			******************************************************/
						
		//Méthodes publiques
		
			//Modification des variables
			
			public function set trainVitesseSG(vit:Number):void{
				vitesseTrain = vit;
			}
			
			public function set scooterVitesseSG(vit:Number):void{
				vitesseScooter = vit;
			}
			
			public function set balleVitesseSG(vit:Number):void{
				vitesseBalle = vit;
			}
			
			public function set referentielSG(ref:String):void{
				referentiel = ref;
			}
			
			public function set tempsAnimationSG(num:Number):void{
				tempsAnimation = num;
			}
			
			public function set vitesseAnimationSG(num:Number):void{
				vitesseAnimation = num;
			}
			
			public function get referentielSG():String{
				return referentiel;
			}
			
			public function get trainVitesseSG():Number{
				return vitesseTrain;
			}
			
			public function get scooterVitesseSG():Number{
				return vitesseScooter;
			}
			
			public function get balleVitesseSG():Number{
				return vitesseBalle;
			}
			
			public function get tempsAnimationSG():Number{
				return tempsAnimation;
			}
			
			public function get vitesseAnimationSG():Number{
				return vitesseAnimation;
			}
			
			/*public function defauts():void{
				leTrain.x = 275;
				laBalle.x = 440;
				leScooter.x = 360;
				persoSol.x = 380;
			}*/
			
			//Contrôle du mouvement
			public function depart():void{
				switch(referentiel){
					case 'sol':
						mouvement = new Tween(this,0,vitesseAnimation,tempsAnimation,-1,lancerSol,reinitialise);
						break;
					case 'scooter':
						mouvement = new Tween(this,0,vitesseAnimation,tempsAnimation,-1,lancerScooter,reinitialise);
						break;
					case 'train':
						mouvement = new Tween(this,0,vitesseAnimation,tempsAnimation,-1,lancerTrain,reinitialise);
						break;
				}
			}
			
			public function stop():void{
				if(mouvement){
					mouvement.stop();
				}
			}
			
			public function pause():void{
				if(mouvement){
					mouvement.pause();
				}
			}
		
			public function resume():void{
				if(mouvement){
					mouvement.resume();
				}
			}
			
			
			//Constructeur
			
			public function Translations(){
				translation(referentiel);
			}
		//Méthodes privées
			private function translation(ref:String):void{
				switch(ref){
					case 'sol':
					 defaut();
					 addChild(leTrain);
					 addChild(leScooter);
					 addChild(laBalle);
					 addChidl(persoTrainD);
					 addChild(persoTrainG);
					 addChild(persoSol);
					 
					 leTrain.x=departPosition.train;
					 leScooter.x=departPostion.scooter;
					 laBalle.x= departPosition.balle;
					 persoSol.x= departPosition.perso;
					 
					 lancerSol(0);
					 break;
					case 'scooter':
					 lancerScooter(0);
					 break;
					case 'train':
					 lancerTrain(0);
					 break;  
				}
			}
			
			private function reinitialise():void{
				translation(referentiel);
			}
			
			//Mouvement dans le référentiel du sol
			private function lancerSol(val:Number):void{
				var positionBalle:int;
				var positionMax:int;
				var vitesseMin:Number;
				// Déterminer la variable qui croit le moins vite
				if(vitesseTrain > vitesseScooter){
					vitesseMin = vitesseScooter;
				}else{
					vitesseMin = vitesseTrain;
				}
				
				if(vitesseMin*val>370){
					reinitialise(); //Si on est hors du cadre on arrete l'animation 
				}
				
				//L'animation 
				leScooter.x= int(departPosition.scooter) - vitesseScooter*val;
				leTrain.x = int(departPosition.train) + vitesseTrain*val;
				persoTrainG.x = leTrain.x + 2;
				persoTrainD.x = leTrain.x + 168;
				positionMax = persoTrainG.x + 20;
				positionBalle = int(departPostion.balle) + (vitesseTrain-vitesseBalle)*val;
				if(positionBalle<positionMax){
					laBalle.x=positionMax;
				}else{
					laBalle.x = positionBalle;
				}
			}
			private function lancerScooter(val:Number):void{						
			}
			
			private function lancerTrain(val:Number):void{
			}			
		}
}
