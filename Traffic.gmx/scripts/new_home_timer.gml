return avghometimer - round(rush_effect*(sin(pi*timeofday/day_interval))^2) - hometimerdev + irandom(2*hometimerdev);
