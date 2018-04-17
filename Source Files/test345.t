import GUI 
include "Scores.t" 

var summativeP : int := Window.Open ("graphics:1200;900") 
var font : int := Font.New ("Segoe UI Light:40")
var font4 : int := Font.New ("Segoe UI Light:60")
var x1, y1, z1, h1, v1, p, q, h2, v2, C1, C2, sbx1, sby1, pace1, pace2, finalTime1, cx, cy, ca : int := 0 
var carrier : string := "" 
var lightC : int := Pic.FileNew ("lightC.bmp")
var LightC : int := Sprite.New (lightC)
var lightC2 : int := Pic.FileNew ("lightC2.bmp")
var LightC2 : int := Sprite.New (lightC2)
var lightC3 : int := Pic.FileNew ("lightC3.bmp")
var LightC3 : int := Sprite.New (lightC3)
var lightC4 : int := Pic.FileNew ("lightC4.bmp")
var LightC4 : int := Sprite.New (lightC4)
var sb2 : int := Pic.FileNew ("sb2.bmp")
var sB2 : int := Sprite.New (sb2)
var core : int := Pic.FileNew ("core.bmp")
var Core : int := Sprite.New (core) 
var ch1 : array char of boolean
var ch2 : array char of boolean
var gameOver1, chase, beginGame : boolean := false

var highScores : int 
var x, y, h, v, z, keyx, torx1, torx2, tory1, tory2, keyy, keyID, score, count, pace, sbx, sby, finalTime, hp, hpB, bTh, hIx, hIy : int := 0
var startTime : real := 0
var keyfound, gameOver, retry, stopmusic, torrset, hSpawn, secondL: boolean := false
var key : int := Pic.FileNew ("key.bmp")
var sb : int := Pic.FileNew ("sb.bmp")
var hpI : int := Pic.FileNew ("hp.bmp")
var sB : int := Sprite.New (sb)
var HpI : int := Sprite.New (hpI)
var ch : array char of boolean 

proc moveText (text : string, alignment : real, y, font, hintTextC : int)
    Font.Draw (text,
        round (alignment * (maxx - Font.Width (text, font))), y,
        font, hintTextC)
end moveText

process clues (a, b, c, d : int)
    delay (3000)
    drawfillbox (a, b, c, d, black)
end clues 

process intromusic 
    loop
        Music.PlayFile ("solar.mp3")
        exit when stopmusic 
    end loop 
    Music.PlayFileStop 
end intromusic 

proc intro 
    moveText ("Make points by avoiding the light beams", 0.5, 440, font, 53)
    moveText ("and collecting energy cores", 0.5, 380, font, 53)
    drawbox (240, 238, 360, 280, 54)
    moveText ("Continue", 0.5, 250, font, 53)
    loop 
        buttonwait ("down", x, y, z, z) 
        exit when 
        x > 240 & x < 360 & y > 238 & y < 280 
    end loop 
    GUI.SetBackgroundColor (black)
    Pic.ScreenLoad ("key.bmp", 220, 475, picMerge)
    moveText ("+ 25 points", 0.58, 480, font, 53)
    Pic.Draw (hpI, 220, 375, picMerge)
    moveText ("+ Health", 0.55, 380, font, 53)
    moveText ("4 Second Speed Boost", 0.6, 280, font, 53)
    Pic.Draw (sb, 150, 275, picMerge)  
    moveText ("Less Time = More Points", 0.5, 180, font, 53)
    drawbox (150, 35, 450, 80, 54) 
    moveText ("Play", 0.5, 50, font, 53)
    loop 
        buttonwait ("down", x, y, z, z) 
        exit when 
        x > 150 & x < 450 & y > 35 & y < 80 
    end loop 
    cls
    beginGame := true 
end intro

process timer 
    startTime := 0 
    startTime := Time.Elapsed
    drawbox (460, 550, 596, 600, 54) 
    moveText ("Time:   ", 0.92, 570, font, 53) 
    loop
        finalTime := (Time.Elapsed - startTime) div 1000
        drawfillbox (540, 560, 590, 599, black)
        moveText (intstr (finalTime), 0.97, 570, font, 53)
        delay (1000)
        exit when 
        gameOver 
    end loop 
end timer

process moving
    pace := 15
    loop 
        Input.KeyDown (ch) 
        if hasch then 
        elsif h < 1  then 
            h := 599 
            Sprite.Show (LightC2) 
            Sprite.SetPosition (LightC2, h, v, true)
        elsif h > 600 then 
            h := 2 
            Sprite.Show (LightC2) 
            Sprite.SetPosition (LightC2, h, v, true)
        elsif v < 1 then 
            v := 539 
            Sprite.Show (LightC2)
            Sprite.SetPosition (LightC2, h, v, true)
        elsif v > 540 then 
            v := 2
            Sprite.Show (LightC2)
            Sprite.SetPosition (LightC2, h, v, true)
        else 
            Sprite.Show (LightC)
            Sprite.Hide (LightC2) 
            Sprite.SetPosition (LightC, h, v, true)
        end if
        if ch (KEY_UP_ARROW) then
            Sprite.Show (LightC2)
            Sprite.Hide (LightC)
            v +=5
            Sprite.SetPosition (LightC2, h, v, true)
        elsif ch (KEY_DOWN_ARROW) then
            Sprite.Show (LightC2)
            Sprite.Hide (LightC)
            v -=5 
            Sprite.SetPosition (LightC2, h, v, true)
        else 
            Sprite.Show (LightC) 
            Sprite.Hide (LightC2) 
            Sprite.SetPosition (LightC, h, v, true)
        end if
        if ch (KEY_RIGHT_ARROW) then 
            Sprite.Show (LightC2) 
            Sprite.Hide (LightC) 
            h +=5
            Sprite.SetPosition (LightC2, h, v, true)
        elsif ch (KEY_LEFT_ARROW) then 
            Sprite.Show (LightC2) 
            Sprite.Hide (LightC) 
            h -=5
            Sprite.SetPosition (LightC2, h, v, true)
        else 
            Sprite.Show (LightC) 
            Sprite.Hide (LightC2) 
            Sprite.SetPosition (LightC, h, v, true)
        end if
        delay(pace)
        exit when 
        gameOver
    end loop 
    if gameOver = true then 
        delay (500)
        Sprite.Hide (LightC)
    end if
end moving

process actualScore
    drawbox (310, 550, 455, 600, 54) 
    moveText ("Score:   ", 0.65, 570, font, 53) 
    loop
        drawfillbox (400, 560, 450, 599, black) 
        moveText (intstr (score), 0.72, 570, font, 53) 
        delay(200)
        exit when gameOver 
    end loop 
    
    if gameOver = true then 
        Sprite.Hide (LightC)
        Sprite.Hide (LightC2)
        Sprite.Hide (sB)
        Sprite.Hide (HpI)
        delay (500)
        GUI.SetBackgroundColor (7)
        moveText ("Your score is", 0.5, 500, font2, 54) 
        moveText (intstr (score), 0.5, 420, font2, 53)
        drawbox (150, 185, 450, 230, 54) 
        moveText ("Play Again", 0.5,200,font,53)
        drawbox (560, 560, 597, 597, 54)
        moveText ("X", 0.98, 570, font, 39)
        drawbox (150, 35, 450, 80, 54) 
        moveText ("High Scores", 0.5, 50, font, 53)
    end if
end actualScore 

process speedBoost 
    pace := 15
    sbx := 0
    sby := 0
    loop
        randint (sbx, 5, 595)
        randint (sby, 5, 520)
        Sprite.Show (sB)
        Sprite.SetPosition (sB, sbx, sby, true)
        loop 
            if Math.Distance(h, v, sbx + 10, sby + 13) < 40 then 
                Sprite.Hide (sB)
                pace := 8
            end if 
            exit when 
            pace = 8
        end loop 
        delay (4000)
        pace := 15 
        exit when 
        gameOver
    end loop 
end speedBoost 

process Health 
    drawbox (1, 550, 304, 600, 54)
    drawfillbox (531, 551, 599, 599, black)
    moveText("Health:", 0.02, 570, font, 53)
    delay (1000)
end Health

process damageT 
    hpB := 97 
    hp := 297 
    drawfillbox(hpB, 557, hp, 592, 77) 
    loop
        if whatdotcolour (h, v) = 43 then 
            hp -=2
            drawfillbox(97, 557, 297, 592, 7)
            drawfillbox(hpB, 557, hp, 592, 77)
            delay (3)
        end if
        exit when hp = hpB 
    end loop
    if hp = hpB then 
        gameOver := true 
    end if
end damageT

process HealthI 
    hIx := 0
    hIy := 0
    loop
        randint (hIx, 5, 595)
        randint (hIy, 5, 520)
        Sprite.SetPosition (HpI, hIx, hIy, true)
        Sprite.Show (HpI)
        loop 
            if Math.Distance(h, v, hIx, hIy) < 40 & hp < 267 then 
                Sprite.Hide (HpI)
                for i : 1 .. 30 
                    hp += 1
                    drawfillbox(97, 557, 297, 592, 7)
                    drawfillbox(hpB, 557, hp, 592, 77)
                    delay (10)
                end for
            end if 
            exit when 
            Math.Distance(h, v, hIx, hIy) < 40 & hp < 267
        end loop 
        delay (4000)
        exit when 
        gameOver
    end loop
end HealthI

proc scoreScreen 
    GUI.SetBackgroundColor(7)
    Pic.ScreenLoad ("backarrow.bmp", 10, 560, picMerge)
    Pic.ScreenLoad ("resetb.bmp", 530, 530, picMerge)
    moveText ("High Scores", 0.5, ys + 90, font, 53)
    moveText ("#          Name                          Score", 0.3, ys + 45, font, 53)
    for i : 1 .. 10 
        moveText (intstr (i), 0.1, ys - 5, font, 53) 
        moveText (newUser(i).userName, 0.3, ys - 5, font, 53)
        moveText (intstr (newUser(i).score), 0.7, ys - 5, font, 53)
        ys -=50
        delay (100)
    end for
end scoreScreen

proc changeScreenReset
    loop 
        buttonwait ("down", x, y, z, z) 
        exit when 
        x > 5 & x < 555 & y > 75 & y < 595
    end loop
    if  x > 5 & x < 555 & y > 75 & y < 595 then 
        Window.Hide (highScores)
        Window.Show (summativeP)
    elsif x > 525 & x < 595 & y > 525 & y < 595 then 
        for i : 1 .. 11 
            newUser(i).score := 0 
            newUser(i).userName := " " 
        end for
    end if
end changeScreenReset

process torrs 
    loop
        loop
            randint (torx1, 0, 572) 
            randint (torx2, 0, 572) 
            randint (tory1, 0, 522) 
            randint (tory2, 0, 522) 
            
            if Math.Distance (torx1, 0, torx2, 0) > 10 & Math.Distance (tory1, 0, tory2, 0) > 10 then
                torrset := true 
            end if
            exit when torrset
        end loop
        
        drawfillbox (0, 0, 600, 549, 7)
        
        Pic.ScreenLoad ("torrN.bmp", torx1, 0, picMerge)
        Pic.ScreenLoad ("torrS.bmp", torx2, 522, picMerge)
        Pic.ScreenLoad ("torrE.bmp", 0, tory1, picMerge)
        Pic.ScreenLoad ("torrW.bmp", 572, tory2, picMerge)
        
        delay (1500)
        
        Draw.ThickLine (torx1 + 14, 28, torx1 + 14, 545, 5, 43)
        Draw.ThickLine (torx2 + 14, 520, torx2 + 14, 0, 5, 43)
        Draw.ThickLine (28, tory1 + 13, 600, tory1 + 13, 5, 43)
        Draw.ThickLine (0, tory2 + 13, 572, tory2 + 13, 4, 43)
        
        delay (3000)
        exit when gameOver
    end loop
end  torrs 

proc saveFile
    open : FileNum, ("Scores"), write 
    write : FileNum, newUser 
    close : FileNum 
end saveFile

loop
    if secondL then 
        retry := false
        keyfound := false 
        gameOver := false 
        beginGame := false 
        score := 0 
        hp := 100 
        
        h := 300 
        v := 300
        
        Sprite.Show (LightC)
        Sprite.SetPosition (LightC, h, v, true) 
        
        fork timer    
        fork moving   
        fork actualScore
        fork torrs    
        fork speedBoost
        fork HealthI  
        fork Health   
        fork damageT  
    end if
    
    loop
        buttonwait ("down", x, y, z, z)
        if x > 560 & x < 597 & y > 560 & y < 597 then 
        elsif x > 150 & x < 450 & y > 35 & y < 80 then 
            Window.Hide (summativeP)
            highScores := Window.Open("graphics:600;600")
            ys := 480 
            if score > newUser(10).score & x > 150 & x < 450 & y > 35 & y < 80 then
                GUI.SetBackgroundColor(7)
                moveText ("You made it into the top 10 scores !", 0.5, 520, font, 53)
                moveText ("Enter your first and last name", 0.5, 480, font, 53) 
                get newUser(11).userName : * 
                newUser(11).score :=  score
                cls
                Sorting  
                scoreScreen
                changeScreenReset
                saveFile
            elsif x > 150 & x < 450 & y > 35 & y < 80 then 
                scoreScreen
                changeScreenReset
                saveFile
            end if 
            exit when 
            x > 150 & x < 450 & y > 185 & y < 230 or x > 560 & x < 597 & y > 560 & y < 597
        end if
        exit when 
        x > 560 & x < 597 & y > 560 & y < 597
    end loop
end loop 

stopmusic := true 
Music.PlayFileStop
