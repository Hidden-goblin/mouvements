package assets
{
	import flash.display.Shape;
	
	import mx.effects.Tween;

	public class RotationReferentiel extends Shape
	{   
		private var taille:int;
		private var mouvement:Tween;
		private var tempsAnimation:Number = 3000;
		private var typeAnimation:String ='disque';
		
		public function RotationReferentiel()
		{
			super();
		}
//methodes privées

	private function rotationReferentiel():void{
		lancer(0);
	}
	
	private function lancer(val:Number):void{
		var etalon:int = int(7*taille/74);
		var rayon :int = 4*etalon;
		var largeur :int = int(2*etalon/7);
		var gap :int =  int(etalon/7);
		
		var centre:int = int(taille/2);
	
		var pointX:int = centre;
		var pointY:int = centre+rayon;
		
		switch(typeAnimation){
			case 'disque':
				graphics.clear();
				graphics.beginFill(couleurDisque,1);
				graphics.drawCircle(centre,centre,rayon);
				graphics.endFill();
				
				break;
			case 'sol':
				break;
		}
	}
	
	private function arreter(val:Number):void{
		
	}
//méthodes publiques
	public function set dureeAnimation(nb:Number):void{
		tempsAnimation = nb;
	} 
	
	public function get dureeAnimation():Number{
		return tempsAnimation;
	}
	
	public function typeAnim(t:string):void{
		typeAnimation = t;
	}
	
	public function dessine(t:int):void{
		taille = t;
		rotationReferentiel();
	}	
	
	public function depart():void{
		mouvement = new Tween(this,0,2*Math.PI,tempsAnimation,-1,lancer,arreter);
	}	
	}
}
