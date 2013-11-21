package assets
{
	import flash.display.Shape;

	public class Cabine extends Shape
	{
		public function Cabine(largeur:int,hauteur:int,couleur:Number)
		{
			super();
			cabine(largeur,hauteur,couleur);
		}
		
		private function cabine(largeur:int,hauteur:int,couleur:Number):void{
			graphics.clear();
			graphics.lineStyle(3,couleur,1);
			graphics.moveTo(int(largeur/2),0);
			graphics.lineTo(int(largeur/2),int(hauteur/2));
			graphics.moveTo(0,int(hauteur/2));
			graphics.beginFill(couleur,1);
			graphics.drawRect(0,int(hauteur/2),int(largeur),int(hauteur/2));
			graphics.endFill();
			
		}
	}
}