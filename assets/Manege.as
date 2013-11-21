package assets
{
	import flash.display.Shape;
	
	import mx.effects.Tween;

	public class Manege extends Shape
	{
		private var mouvement:Tween;
		private var taille:int;
		private var tempsAnimation:Number;
		private var couleurDisque:Number = 0xFF6633; 
		private var couleurCabine:Number = 0x660000;
		private var typeAnimation:String ='sol';
		
		public function dessine(largeur:int,type:String):void{
			taille = largeur;
			manege(type);
		}
		
		public function couleur(coulDisque:Number,coulCabine:Number):void{
			couleurDisque = coulDisque;
			couleurCabine = coulCabine;
		}
		
		public function efface():void{
			graphics.clear();
		}
		public function Manege()
		{
			//super();
			
		}

		public function set animation(typeAnim:String):void{
			typeAnimation = typeAnim;
		}

		public function get animation():String{
			return typeAnimation;
		}
		
	   private function manege(type:String):void{
	   		switch(type){
	   		case 'circulaire':
	   			lancerCirculaire(0);
	   			break;
	   		case 'translation':
	   			lancerTranslation(0);
	   			break;
	   		case 'referentiel':
	   			lancerReferentiel(0);
	   			break		   				
	   	}
	   }
	   
	   public function depart(duree:Number,type:String):void{
	   	tempsAnimation = duree;
	   	switch(type){
	   		case 'circulaire':
	   			mouvement = new Tween(this,0,2*Math.PI,tempsAnimation,-1,lancerCirculaire,encoreCirculaire);
	   			break;
	   		case 'translation':
	   			mouvement = new Tween(this,0,2*Math.PI,tempsAnimation,-1,lancerTranslation,encoreTranslation);
	   			break;
	   		case 'referentiel':
	   			mouvement = new Tween(this,0,2*Math.PI,tempsAnimation,-1,lancerReferentiel,encoreReferentiel);
	   			break		   				
	   	}

	   }
	   
	   public function pause():void{
	   	if(mouvement){
	   		mouvement.pause();
	   	}
	   }
	   
	   public function reprendre():void{
	   	if(mouvement){
	   		mouvement.resume();
	   	}
	   }
	   
	   public function stop(type:String):void{
	   	if(mouvement){
	   		mouvement.stop();
	   		manege(type);
	   	}
	   }
//mouvement de rotation 	   
	   private function lancerCirculaire(val:Number):void{
	   	var rayon:int = int(taille/3.2);
	   	var hauteur:int = int(0.6*rayon);
	   	var largeurCabine:int = int(0.8*hauteur);
	   	var petitRayon:Number = Math.sqrt(Math.pow(largeurCabine,2)/4 + Math.pow(rayon + hauteur/3,2));
	   	var grandRayon:Number = Math.sqrt(Math.pow(largeurCabine,2)/4 + Math.pow(rayon + 5*hauteur/6,2));
	   	var anglePetitRayon:Number = Math.asin(largeurCabine / (2*petitRayon));
	   	var angleGrandRayon:Number = Math.asin(largeurCabine / (2*grandRayon));
	   	var centreX:int = int(taille/2);
	   	var centreY:int = int(taille/2);
	   		
	   	graphics.clear();
		graphics.beginFill(couleurDisque,1);
		graphics.drawCircle(centreX,centreY,rayon);//Dessin du manege
		graphics.endFill();
		graphics.moveTo(centreX,centreY);
		graphics.lineStyle(3,0xFFFFFF-couleurDisque,1);//Dessin d'une ligne dans le dessin du manege
		graphics.lineTo(centreX - int(rayon*Math.sin(val)),centreY + int(rayon*Math.cos(val)));
		graphics.lineStyle(3,couleurCabine,1);//Dessin de l'attache de la cabine
		graphics.moveTo(centreX - int(rayon*Math.sin(val)),centreY + int(rayon*Math.cos(val)));
		graphics.lineTo(centreX - int((rayon + hauteur/2)*Math.sin(val)),centreY +  int((rayon + hauteur/2)*Math.cos(val)));
		graphics.moveTo(centreX - int(petitRayon*Math.sin(val+anglePetitRayon)),centreY + int(petitRayon*Math.cos(val+anglePetitRayon)));
		graphics.beginFill(couleurCabine,1);//Dessin de la cabine
		graphics.lineTo(centreX - int(petitRayon*Math.sin(val-anglePetitRayon)),centreY + int(petitRayon*Math.cos(val-anglePetitRayon)));
		graphics.lineTo(centreX - int(grandRayon*Math.sin(val-angleGrandRayon)),centreY + int(grandRayon*Math.cos(val-angleGrandRayon)));
		graphics.lineTo(centreX - int(grandRayon*Math.sin(val+angleGrandRayon)),centreY + int(grandRayon*Math.cos(val+angleGrandRayon)));
		graphics.lineTo(centreX - int(petitRayon*Math.sin(val+anglePetitRayon)),centreY + int(petitRayon*Math.cos(val+anglePetitRayon))); 
		graphics.endFill();
		graphics.lineStyle(3,0xFFFFFF - couleurCabine,1);
		graphics.moveTo(centreX - int(petitRayon*Math.sin(val-anglePetitRayon)),centreY + int(petitRayon*Math.cos(val-anglePetitRayon)));
		graphics.lineTo(centreX - int(grandRayon*Math.sin(val+angleGrandRayon)),centreY + int(grandRayon*Math.cos(val+angleGrandRayon)));
		
	   }
	   
	   private function encoreCirculaire(val:Number):void{
	   	mouvement = new Tween(this,0,2*Math.PI,tempsAnimation,-1,lancerCirculaire,encoreCirculaire);
	   }
//Mouvement de translation circulaire
	private function lancerTranslation(val:Number):void{
		var rayon:int = int(taille/3.2);
	   	var hauteur:int = int(0.6*rayon);
	   	var largeurCabine:int = int(0.8*hauteur);
	   	var centreX:int = int(taille/2);
	   	var centreY:int = int(taille/2);
	   	var pointX:int,pointY:int; //Point : élément du disque où est attaché la cabine
	   	
	   	pointX = centreX - int(rayon*Math.sin(val));
	   	pointY = centreY + int(rayon*Math.cos(val));	
	   	graphics.clear();
		graphics.beginFill(couleurDisque,1);//Dessin du manege
		graphics.drawCircle(centreX,centreY,rayon);
		graphics.endFill();
		graphics.moveTo(centreX,centreY);//Dessin rayon du disque
		graphics.lineStyle(3,0xFFFFFF-couleurDisque,1);
		graphics.lineTo(pointX,pointY);
		graphics.lineStyle(3,couleurCabine,1);
		graphics.moveTo(pointX,pointY);//Dessin accroche de la cabine
		graphics.lineTo(pointX,pointY + int(hauteur/2));
		graphics.moveTo(pointX - int(largeurCabine/2),pointY + int(hauteur/3));
		graphics.beginFill(couleurCabine,1);
		graphics.drawRect(pointX - int(largeurCabine/2),pointY + int(hauteur/3),largeurCabine,int(hauteur/2));
		graphics.endFill();
		graphics.lineStyle(3,0xFFFFFF - couleurCabine,1);
		graphics.moveTo(pointX + int(largeurCabine/2),pointY + int(hauteur/3));
		graphics.lineTo(pointX - int(largeurCabine/2),pointY + int(hauteur/3) + int(hauteur/2));
		
		
	}	
	
	private function encoreTranslation(val:Number):void{
		mouvement = new Tween(this,0,2*Math.PI,tempsAnimation,-1,lancerTranslation,encoreTranslation);
	}  
//Mouvement dans un r�f�rentiel en rotation	
	private function lancerReferentiel(val:Number):void{
		
		var etalon:int = int(7*taille/74);
		var rayon :int = 4*etalon;
		var largeur :int = int(2*etalon/7);
		var gap :int =  int(etalon/7);
		
		var centre:int = int(taille/2);
	
		var pointX:int;
		var pointY:int;
		
		switch(typeAnimation){
			case 'disque':
				pointX = centre + int(rayon*Math.sin(val));
				pointY = centre + int(rayon*Math.cos(val));	
				graphics.clear();
				graphics.beginFill(couleurDisque,1);
				//graphics.drawCircle(pointX,pointY + 2*gap,gap);
				graphics.drawCircle(pointX+2*gap*Math.sin(val),pointY + 2*gap*Math.cos(val),gap);
				graphics.drawCircle(centre,centre,rayon);
				graphics.endFill();
				graphics.lineStyle(2*gap,0xFFFFFF - couleurDisque,0.5);
				graphics.moveTo(centre,centre +rayon);
				graphics.lineTo(centre,centre - rayon);
				graphics.lineStyle(3,0x000000,1)
				graphics.beginFill(0x000000,1);
				graphics.drawCircle(centre,centre +rayon *(1-val/Math.PI),gap);
				graphics.endFill();			
				
				break;
			case 'sol':
				pointX = centre - int(rayon*Math.sin(val));
				pointY = centre + int(rayon*Math.cos(val));	
				graphics.clear();
				graphics.beginFill(couleurDisque,1);
				//graphics.drawCircle(pointX-2*gap*int(Math.sin(val)),pointY + 2*gap*int(Math.cos(val)),gap);
				graphics.drawCircle(centre,centre + rayon +2*gap,gap)
				graphics.drawCircle(centre,centre,rayon);
				graphics.endFill();
				graphics.lineStyle(2*gap,0xFFFFFF - couleurDisque,0.5);
				graphics.moveTo(pointX,pointY);
				graphics.lineTo(pointX+2*rayon*Math.sin(val),pointY-2*rayon*Math.cos(val));
				graphics.lineStyle(3,0x000000,1)
				graphics.beginFill(0x000000,1);
				graphics.drawCircle(pointX+(centre-pointX)*val/Math.PI,pointY+(centre-pointY)*val/Math.PI,gap);
				graphics.endFill();			
				break;
		}
	}
	
	private function encoreReferentiel(val:Number):void{
		mouvement = new Tween(this,0,2*Math.PI,tempsAnimation,-1,lancerReferentiel,encoreReferentiel);
	}
	}
}