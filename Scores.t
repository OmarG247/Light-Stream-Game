var ys, FileNum : int := 0
var font2 : int := Font.New ("Segoe UI Light:30")

type 
newScore : 
record 
    userName : string (30)
    score : int 
end record 

var newUser : array 1 .. 11 of newScore

open : FileNum, ("Scores"), read 
read : FileNum, newUser 
close : FileNum 

proc Sorting 
    var temp : newScore
    for j : 1 .. 10
        for i : 1 .. 10 
            if  newUser(i).score < newUser(i+1).score then
                temp := newUser (i)
                newUser(i) := newUser (i +1)
                newUser (1+i) := temp
            end if
        end for
    end for
end Sorting 


