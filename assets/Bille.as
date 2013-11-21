package assets
{
	import flash.display.Shape;

	public class Bille extends Shape
	{
		public function Bille(rayon:int=5)
		{
			super();
			bille(rayon);
		}
		private function bille(rayon:int):void{
			graphics.clear();
			graphics.beginFill(0xFFFF00);
			graphics.drawCircle(rayon,rayon,rayon);
			graphics.endFill();
	}
}
}