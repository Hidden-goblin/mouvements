package assets
{
	import flash.display.Shape;

	public class Disque extends Shape
	{
		public function Disque(couleur:Number,rayon:int)
		{
			super();
			disque(couleur,rayon);
		}
		
		private function disque(couleur:Number, rayon:int):void{
			graphics.clear();
			graphics.beginFill(couleur,1);
			graphics.drawCircle(2*rayon,2*rayon,rayon);
			graphics.endFill();
		}
		
	}
}