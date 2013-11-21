// ActionScript file
			//[Bindable]
			//private var messageBalle:String="La vitesse est de " + depart[1].vitesseBalle +" km/h";
			//[Bindable]
			//private var messageTrain:String="La vitesse est de " + depart[1].vitesseTrain +" km/h";
			//[Bindable]
			//private var messageScooter:String="La vitesse est de " + depart[1].vitesseScooter +" km/h";
			import assets.Manege;
			
			import flash.display.Shape;
			
			[Bindable]
			private var maBille:Bille = new Bille(5);
			[Bindable]			
			private var train:Train = new Train(190,60);
			[Bindable]
			private var personnage1:Personnage=new Personnage(true);
			[Bindable]
			private var personnage2:Personnage=new Personnage(true);
			[Bindable]
			private var personnage3:Personnage=new Personnage(false);
			[Bindable]
			private var scooter:Scooter=new Scooter();
			[Bindable]
			private var disque:Shape = new Disque(0xB0B0B0,100);
			[Bindable]						
			private var cabine:Shape = new Cabine(60,60,0x0F0F0F);
			[Bindable]
			private var manege:Manege = new Manege();			
			
			public var mouvement:Tween;
			
			private var depart:ArrayCollection = new ArrayCollection([{'laBalleX':440,'trainX':275,'scooterX':360,'personnageSol':380},
			{'vitesseBalle':0,'vitesseTrain':0,'vitesseScooter':0},{'messageBalle' : "La vitesse est de 0 km/h",'messageTrain' : "La vitesse est de 0 km/h",
			'messageScooter' : "La vitesse est de 0 km/h"}]);
			
			private var duree:int=30000; //Duree maximum de l'animation
			
			private var variable:int=500 //Valeur qui défile pendant la duree. Plus elle est petite et plus l'animation est rapide
			
			
			
			