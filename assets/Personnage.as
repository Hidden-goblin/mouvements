package assets
{
	import flash.display.Sprite;

	public class Personnage extends Sprite
	{   
		public function Personnage(orientation:Boolean)
		{
			super();
			personnage(orientation);
		}
		
		private function personnage(orientation:Boolean):void{
			graphics.clear();
			if(orientation){//True orienté vers la droite, false vers la gauche
				graphics.beginFill(0x000000,1);
				graphics.drawCircle(5,5,5);
				graphics.endFill();
				graphics.lineStyle(1,0x000000,1);
				graphics.moveTo(5,4);
				graphics.lineTo(5,30);
				graphics.lineTo(0,45);
				graphics.moveTo(5,30);
				graphics.lineTo(20,45);
				graphics.moveTo(5,15);
				graphics.lineTo(20,10);
			}
			else{
				graphics.beginFill(0x000000,1);
				graphics.drawCircle(15,5,5);
				graphics.endFill();
				graphics.lineStyle(1,0x000000,1);
				graphics.moveTo(15,4);
				graphics.lineTo(15,30);
				graphics.lineTo(20,45);
				graphics.moveTo(15,30);
				graphics.lineTo(0,45);
				graphics.moveTo(15,15);
				graphics.lineTo(0,10);
			}
		}
	}
}