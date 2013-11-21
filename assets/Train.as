package assets
{
	import flash.display.Shape;

	public class Train extends Shape
	{
		public function Train(largeur:int,hauteur:int)
		{
			super();
			train(largeur,hauteur);
		}
		
		private function train(largeur:int,hauteur:int):void{
			var rayon:int=int(largeur/18);
			
			graphics.clear();
			graphics.beginFill(0xaa7000,1);
			graphics.drawRect(0,0,largeur,hauteur);
			graphics.endFill();
			graphics.beginFill(0xa4a4a4,1);
			graphics.drawCircle(2+rayon,hauteur+rayon,rayon);
			graphics.drawCircle(18*rayon -2,hauteur+rayon,rayon);
			graphics.endFill();
		}
		
	}
}