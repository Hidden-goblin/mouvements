package assets
{
	import mx.controls.Spacer;

	public class Scooter extends Spacer
	{
		public function Scooter()
		{
			super();
			scooter();
		}
		
		private function scooter():void{
			graphics.clear();
			graphics.moveTo(5,40);
			graphics.lineStyle(1,0x166a1e,1);
			graphics.lineTo(12,19);
			graphics.lineTo(15,18);
			graphics.moveTo(5,40);
			graphics.lineTo(22,40);
			graphics.beginFill(0x166a1e,1);
			graphics.lineTo(27,31);
			graphics.lineTo(36,31);
			graphics.lineTo(38,40);
			graphics.lineTo(22,40);
			graphics.endFill();
			graphics.beginFill(0x000000,0.5);
			graphics.moveTo(25,31);
			graphics.curveTo(25,25,37,25);
			graphics.lineTo(35,31);
			graphics.lineTo(25,31);
			graphics.endFill();
			graphics.beginFill(0x000000,1);
			graphics.drawCircle(5,40,5);
			graphics.drawCircle(35,40,5);
			graphics.drawCircle(30,5,5);
			graphics.endFill();
			graphics.lineStyle(1,0x000000,1);
			graphics.moveTo(30,5);
			graphics.lineTo(30,25);
			graphics.lineTo(21,30);
			graphics.lineTo(16,39);
			graphics.moveTo(30,15);
			graphics.lineTo(15,18);
		}
	}
}