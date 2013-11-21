// ActionScript file
			private function reinitall():void{
				if(mouvement)
				 {refSolArret(0);}
				laBalle.x = depart[0].laBalleX;
				leTrain.x = depart[0].trainX;
				leScooter.x = depart[0].scooterX;
				lePersonnageSol.x = depart[0].personnageSol;
				lePersonnageTrainDroit.x = leTrain.x + 168;
				lePersonnageTrainGauche.x = leTrain.x + 2;
				sliderVitesseBalle.value = 0;
				sliderVitesseScooter.value = 0;
				sliderVitesseTrain.value = 0;
				messageVitesseTrain.text = "La vitesse est de 0 km/h";
				messageVitesseBalle.text = "La vitesse est de 0 km/h";
				messageVitesseScooter.text = "La vitesse est de 0 km/h";
			}
			
			private function reinit():void{
				if(mouvement)
				 {refSolArret(0);}
				laBalle.x = depart[0].laBalleX;
				leTrain.x = depart[0].trainX;
				leScooter.x = depart[0].scooterX;
				lePersonnageSol.x = depart[0].personnageSol;
				lePersonnageTrainDroit.x = leTrain.x + 168;
				lePersonnageTrainGauche.x = leTrain.x + 2;
			}