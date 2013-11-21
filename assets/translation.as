// ActionScript file
import mx.controls.Text;


			private function translation(Texte:String):void{
				switch (Texte){
					case 'Sol':
						mouvement = new Tween(boutonRefSol,0,variable,duree,-1,refSolDepart,refSolArret);
						break;
					case 'Scooter': 
						mouvement = new Tween(boutonRefScooter,0,variable,duree,-1,refScooterDepart,refSolArret);
						break;
					case 'Train':
						mouvement = new Tween(boutonRefScooter,0,variable,duree,-1,refTrainDepart,refSolArret);
						break; 
				}
			}	


						
			private function refSolDepart(val:Number):void{
				var positionBalle:int;
				var positionMax:int;
				var vitesseMin:Number;
				// Déterminer la variable qui croit le moins vite
				if(depart[1].vitesseTrain> depart[1].vitesseScooter){
					vitesseMin = depart[1].vitesseScooter;
				}else{
					vitesseMin = depart[1].vitesseTrain;
				}
				
				if(vitesseMin*val>370){
					refSolArret(val); //Si on est hors du cadre on arrete l'animation 
				}
				
				//L'animation 
				leScooter.x= int(depart[0].scooterX) - depart[1].vitesseScooter*val;
				leTrain.x = int(depart[0].trainX) + depart[1].vitesseTrain*val;
				lePersonnageTrainGauche.x = leTrain.x + 2;
				lePersonnageTrainDroit.x = leTrain.x + 168;
				positionMax = lePersonnageTrainGauche.x + 20;
				positionBalle = int(depart[0].laBalleX) + (depart[1].vitesseTrain-depart[1].vitesseBalle)*val;
				if(positionBalle<positionMax){
					laBalle.x=positionMax;
				}else{
					laBalle.x = positionBalle;
				}
			}
			
			private function refScooterDepart(val:Number):void{
				var positionBalle:int;
				var positionMax:int;
				var vitesseMin:Number;
				if(depart[1].vitesseTrain > depart[1].vitesseScooter){
					vitesseMin = depart[1].vitesseScooter;
				}else{
					vitesseMin = depart[1].vitesseTrain;
				}
				
				if(vitesseMin*val>370){
					refSolArret(val);
				}
				lePersonnageSol.x= 380 + depart[1].vitesseScooter*val;
				leTrain.x = int(depart[0].trainX)+(depart[1].vitesseTrain + depart[1].vitesseScooter)*val;
				lePersonnageTrainGauche.x = leTrain.x + 2;
				lePersonnageTrainDroit.x = leTrain.x + 168;
				positionMax = lePersonnageTrainGauche.x + 20;
				positionBalle = int(depart[0].laBalleX) + (depart[1].vitesseScooter+depart[1].vitesseTrain-depart[1].vitesseBalle)*val;
				if(positionBalle<positionMax){
					laBalle.x=positionMax;
				}else{
					laBalle.x = positionBalle;
				}
				lePersonnageSol.x = 380 +depart[1].vitesseScooter*val;
			}
	
			
			private function refTrainDepart(val:Number):void{
				var positionBalle:int;
				var positionMax:int;
				var vitesseMin:Number;
				// Déterminer la variable qui croit le moins vite
				if(depart[1].vitesseTrain> depart[1].vitesseScooter){
					vitesseMin = depart[1].vitesseScooter;
				}else{
					vitesseMin = depart[1].vitesseTrain;
				}
				
				if(vitesseMin*val>370){
					refSolArret(val); //Si on est hors du cadre on arrete l'animation 
				}
				
				//L'animation 
				leScooter.x= int(depart[0].scooterX)-(depart[1].vitesseScooter+depart[1].vitesseTrain)*val;
				lePersonnageSol.x = int(depart[0].personnageSol) - depart[1].vitesseTrain*val;
				positionMax = lePersonnageTrainGauche.x + 20;
				positionBalle = int(depart[0].laBalleX) - depart[1].vitesseBalle*val;
				if(positionBalle<positionMax){
					laBalle.x=positionMax;
				}else{
					laBalle.x = positionBalle;
				}
			}
			
			private function refSolArret(val:Number):void{
				mouvement.stop();
			}