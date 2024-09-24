# Game of Thrones

Group project for Game of Thrones deaths.

GOT_updated.cvs has the gender in all lowercase. 

Powerpoint link: https://docs.google.com/presentation/d/1arLvquhG8uf8NF7RONxhYgA-VSHI3vLpnJpyu5oTrtc/edit?usp=sharing

## Things to do:
- [x] Correct syntax of gender
- [] Correct the time in hours (there are some negative values).
- [] Create a column for named vs unnamed

## Potential questions to address:
- []Do characters that switch sides live longer?
- []Does social status affect how long the characters lived?
- []Does gender affect how long the characters lived?
- []How many cases of: died of natural causes, murdered, executed and suicide?
- []Do named characters live longer than unnamed characters?


### Want to look at named vs unnamed characters:
We could do it manually or use a dictionary package (check out dictionaRy)
This involves checking if every name exists in the dictionary. Unnamed characters like "thin man" and "unnamed" would exist in the dictionary, while named characters would not (assuming all the names don't have meanings). 

### Do characters that switch sides live longer?

### Grouping causes of death in categories:
We would use a dictionary library to group all the cases into murdered, death by natural cause, suicide and execution. This involves finding the meaning of every word in the string. For example, if any word is a synonym for "murdered", the character is entered in a new "murdered" column. 

