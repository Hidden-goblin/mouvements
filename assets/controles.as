// ActionScript file
import flash.events.Event;

	private function pauseRotation():void{
		if(boutonPauseRotation.label == "pause"){
			manege.pause();
			boutonPauseRotation.label = "reprendre";
		}
		else{
			manege.reprendre();
			boutonPauseRotation.label = "pause";
		}
	}
	
	private function pauseTranslation():void{
		if(boutonPauseTranslation.label == "pause"){
			manege.pause();
			boutonPauseTranslation.label = "reprendre";
		}
		else{
			manege.reprendre();
			boutonPauseTranslation.label = "pause";
		}
	}
	
	private function choixReferentielCirculaire(event:ItemClickEvent):void{
		switch(event.currentTarget.selectedValue)
		 {
			case 'sol':
				manege.animation = 'sol';
				manege.stop('referentiel');
				break;
			case 'disque':
				manege.animation = 'disque';
				manege.stop('referentiel');
				break;	
			
		 }
	
	}
	
	private function pauseReferentiel():void{
		if(boutonPauseReferentiel.label == "pause"){
			manege.pause();
			boutonPauseReferentiel.label = "reprendre";
		}
		else{
			manege.reprendre();
			boutonPauseReferentiel.label = "pause";
		}
	}