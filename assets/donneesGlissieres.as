// ActionScript file
			private function sliderBalle(event:SliderEvent):void{
				var currentSlider:Slider=Slider(event.currentTarget);
                depart[1].vitesseBalle = Number(currentSlider.value);
				messageVitesseBalle.text = "La vitesse est de " + depart[1].vitesseBalle + " km/h";
			}
			
			private function sliderScooter(event:SliderEvent):void{
				var currentSlider:Slider=Slider(event.currentTarget);
                depart[1].vitesseScooter = Number(currentSlider.value);
				messageVitesseScooter.text = "La vitesse est de " + depart[1].vitesseScooter + " km/h";
			}
			
			private function sliderTrain(event:SliderEvent):void{
				var currentSlider:Slider=Slider(event.currentTarget);
                depart[1].vitesseTrain = Number(currentSlider.value);
				messageVitesseTrain.text = "La vitesse est de " + depart[1].vitesseTrain + " km/h";
			}