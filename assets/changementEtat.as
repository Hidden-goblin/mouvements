// ActionScript file
	private function transition(texte:String):void{
		switch (texte) {
			case 'translation':
				this.currentState="translationReferentiel";
				messageVitesseBalle.text = "La vitesse est de 0 km/h";
				messageVitesseScooter.text = "La vitesse est de 0 km/h";
				messageVitesseTrain.text = "La vitesse est de 0 km/h";
				leTrain.x = depart[0].trainX;
				lePersonnageTrainGauche.x =leTrain.x + 2;
				lePersonnageTrainDroit.x =leTrain.x + 168;
				laBalle.x = depart[0].laBalleX;
				lePersonnageSol.x = depart[0].personnageSol;
				leScooter.x = depart[0].scooterX;
				break;
			case 'circulaire':
				this.currentState="translationCirculaire";
				imageTranslationCirculaire.source = '';	
				manege.stop('translation');
				manege.efface();
				manege.dessine(400,'translation');
				imageTranslationCirculaire.source = manege;
				break;
			case 'rotation':
				this.currentState="rotation";
				imageRotation.source = '';				
				manege.stop('circulaire');
				manege.efface();
				manege.dessine(400,'circulaire');
				imageRotation.source = manege;
				//cabineRotation.x = 170;
				//cabineRotation.y = 300;
				break;
			case 'rotationref':
				this.currentState="rotationReferentiel";
				imageReferentiel.source ='';
				manege.stop('referentiel');
				manege.efface();
				manege.dessine(400,'referentiel');
				imageReferentiel.source = manege;
				break;			
		}
	}