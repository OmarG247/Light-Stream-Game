type 
newScore : 
record 
    userName : string (30)
    score : int 
end record 

var newUser : array 1 .. 11 of newScore
var FileNum : int := 0 

for i : 1 .. 11
    newUser (i).userName := "User Name"
    newUser (i).score := 0
end for

open : FileNum, ("Scores"), write 
write : FileNum, newUser 
close : FileNum 