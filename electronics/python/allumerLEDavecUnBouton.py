#!/usr/bin/env python

import RPi.GPIO as GPIO # import le module GPIO
import time # Afin d utiliser le module sleep pour stopper les procedures

Bouton=21 # lemplacement du bouton sur le pin 21 du RPI
LED=17 # lemplacement de la LED sur le pin 17 du RPI

GPIO.setmode(GPIO.BCM)  # Charge la carte de position des pins fonction du RPI utilise
GPIO.setwarnings(False) # Desactive les warnings

#Initialisation de la LED
GPIO.setup(LED,GPIO.OUT) # le pin 17 est configure comme un pin de sortie ( vers lequel on envoi un signal)
GPIO.output(LED,GPIO.HIGH) # On envoie un signal 1 ( GPIO.HIGH==True) ==> la led s active
time.sleep(1) # on  attend  1 seconde
GPIO.output(LED,GPIO.LOW)  # on envoie un signal 0 ( GPIO.LOW==FALSE) ==> la led s eteint

#Initialisation du bouton
GPIO.setup(Bouton,GPIO.IN, pull_up_down=GPIO.PUD_DOWN) # configure le pin 21 comme un pin d entree ( qui recoit un signal, on active pull_up_down de la rpi
GPIO.add_event_detect(Bouton,GPIO.RISING,bouncetime=200) # on configure le temps de clique du bouton a 200ms

try :
	while(True):
		if GPIO.event_detected(Bouton):
			activate = True
			while(activate is True):
				GPIO.output(LED,True)
				time.sleep(0.1)
				GPIO.output(LED,False)
				time.sleep(0.1)
				if GPIO.event_detected(Bouton):
					activate=False
		else:
			GPIO.output(LED,False)	
finally :
	GPIO.cleanup()

