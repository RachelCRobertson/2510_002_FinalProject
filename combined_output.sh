#!/bin/bash

#script
curl -s https://www.tntech.edu/engineering/programs/csc/faculty-and-staff.php | grep -oP '(?<=<h4><strong>)[^,<]*' |
 tr '\n' '#' | tr -d '\r' |
 sed 's/&nbsp;//g' |
 sed 's/#$/\n/'
#output
Gerald Gannod#Maanak Gupta#William Eberle#Sheikh Ghafoor#Stacy Prowell#Anthony Skjellum#Doug Talbert#Amr Hilal#Muhammad Ismail#Michael Rogers#Susmit Shannigrahi#Amani Altarawneh#Prantar Ghosh#MD S Zulkar Nine#Mir Pritom#Jesse Roberts#Eric Brown#Travis Brummett#April Crockett#Benjamin Burchfield#Beata Kubiak#Jacob Strickler#Regis Billings#Cristina Radian#Callie Stewart#Brandon Vandergriff#Barbara Gannod#Dennis Jump#Travis Lee#Riley Shipley#David Elizandro#Martha Kosa#Ambareen Siraj#Mary Daniels#Robin Eberle#Danyelle Hawkins#Amy Davis#Emily Disbrow#Rebecca Hahnert#Sonya Haney#Corbin Cawood

