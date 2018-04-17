%....................................................................................................................Summative Program by Omar Garcia Flores & Martin Ma
%/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

% I am fully aware the program contains a few glitches in the ending screen. 
% To Reset the scores, in the folder, delete the document named "Scores", not "Scores.t". Then Run the program named "kulmemes.t"
% PLEASE NOTE THE LINES MADE BY THE BOXES IN THE FIRST LEVEL ARE INTENDED FOR ARTISTIC PURPOSES AND WERE NOT A MISTAKE THAT I COULD NOT FIX. 
% The program contains music so put your headphones on ! 

%/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
%....................................................................................................................Variables  
import GUI
include "Scores.t" 

var summativeP : int := Window.Open ("graphics:1200;900") 
var font : int := Font.New ("Segoe UI Light:20")
var font4 : int := Font.New ("Segoe UI Light:60")
var x1, y1, z1, h1, v1, p, q, h2, v2, C1, C2, sbx1, sby1, pace1, pace2, finalTime1B, finalTime1R, cx, cy, ca : int := 0 
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
var gameOver1, chase, beginGame, musicstop1, musicstopi : boolean := false

var highScores : int 
var x, y, h, v, z, keyx, torx1, torx2, tory1, tory2, keyy, keyID, score, count, pace, sbx, sby, finalTime, hp, hpB, hIx, hIy, Bx, By, ecount, colourM, colourS, enemyC: int := 0
var startTime : real := 0
var keyfound, gameOver, retry, stopmusic, torrset, hSpawn, secondL, musicstop2, highscore, nothighscore: boolean := false
var bit : int := Pic.FileNew ("bit.bmp")
var sbb : int := Pic.FileNew ("sbb.bmp")
var sbr : int := Pic.FileNew ("sbr.bmp") 
var torn : int := Pic.FileNew ("torrN.bmp")
var tors : int := Pic.FileNew ("torrS.bmp")
var tore : int := Pic.FileNew ("torrE.bmp")
var torw : int := Pic.FileNew ("torrW.bmp")
var torN : int := Sprite.New (torn)
var torS : int := Sprite.New (tors)
var torE : int := Sprite.New (tore)
var torW : int := Sprite.New (torw)
var sBB : int := Sprite.New (sbb)
var sBR : int := Sprite.New (sbr)
var Bit : int := Sprite.New (bit)
var ch : array char of boolean 
var ch3 : array char of boolean 
var chTB : array char of boolean 
var chTR : array char of boolean 
%.....................................................................................................................................................Procedures
proc moveText (text : string, alignment : real, y, font, hintTextC : int)
    Font.Draw (text,
        round (alignment * (maxx - Font.Width (text, font))), y,
        font, hintTextC)
end moveText

process intromusic 
    loop
        Music.PlayFile ("intro.mp3")
        exit when musicstopi   
    end loop 
    Music.PlayFileStop 
end intromusic

process L1music 
    loop
        Music.PlayFile ("level1.mp3")
        exit when musicstop1   
    end loop 
    Music.PlayFileStop 
end L1music 

process L2music 
    loop
        Music.PlayFile ("level2.mp3")
        exit when musicstop2   
    end loop 
    Music.PlayFileStop 
end L2music 

process TimerB 
    loop
        finalTime1B := 0
        loop
            if carrier = "blue" then 
                finalTime1B +=1 
                drawfillbox (1050, 780, 1260, 900, 7)
                moveText(realstr(finalTime1B, 2), 0.97, 810, font4, 53)
                delay (1000)
                if  finalTime1B = 15 then 
                    gameOver1 := true 
                end if
            end if
            exit when 
            carrier = "red" or gameOver1
        end loop 
        exit when 
        gameOver1 = true
    end loop
end TimerB

process TimerR
    loop
        finalTime1R := 0
        loop
            if carrier = "red" then 
                finalTime1R +=1 
                drawfillbox (1050, 780, 1260, 900, 7)
                moveText(realstr(finalTime1R, 2), 0.97, 810, font4, 42)
                delay (1000)
                if  finalTime1R = 15 then 
                    gameOver1 := true 
                end if
            end if
            exit when 
            carrier = "blue" or gameOver1
        end loop
        exit when 
        gameOver1 = true 
    end loop
end TimerR

process moving1
    loop 
        Input.KeyDown (ch1) 
        if hasch then 
        elsif h1 < 1  then 
            h1 := 1199 
            Sprite.Show (LightC2) 
            Sprite.SetPosition (LightC2, h1, v1, true)
        elsif h1 > 1200 then 
            h1 := 2 
            Sprite.Show (LightC2) 
            Sprite.SetPosition (LightC2, h1, v1, true)
        elsif v1 < 1 then 
            v1 := 899 
            Sprite.Show (LightC2)
            Sprite.SetPosition (LightC2, h1, v1, true)
        elsif v1 > 898 then 
            v1 := 2
            Sprite.Show (LightC2)
            Sprite.SetPosition (LightC2, h1, v1, true)
        else 
            Sprite.Show (LightC)
            Sprite.Hide (LightC2) 
            Sprite.SetPosition (LightC, h1, v1, true)
        end if
        if ch1 (KEY_UP_ARROW) then 
            Sprite.Show (LightC2) 
            Sprite.Hide (LightC) 
            v1 +=5
            Sprite.SetPosition (LightC2, h1, v1, true)
        elsif ch1 (KEY_DOWN_ARROW) then 
            Sprite.Show (LightC2) 
            Sprite.Hide (LightC) 
            v1 -=5
            Sprite.SetPosition (LightC2, h1, v1, true)
        else 
            Sprite.Show (LightC) 
            Sprite.Hide (LightC2) 
            Sprite.SetPosition (LightC, h1, v1, true)
        end if
        if ch1 (KEY_RIGHT_ARROW) then 
            Sprite.Show (LightC2) 
            Sprite.Hide (LightC) 
            h1 +=5
            Sprite.SetPosition (LightC2, h1, v1, true)
        elsif ch1 (KEY_LEFT_ARROW) then 
            Sprite.Show (LightC2) 
            Sprite.Hide (LightC) 
            h1 -=5
            Sprite.SetPosition (LightC2, h1, v1, true)
        else 
            Sprite.Show (LightC) 
            Sprite.Hide (LightC2) 
            Sprite.SetPosition (LightC, h1, v1, true)
        end if
        delay(pace1)
        exit when gameOver1
    end loop 
end moving1

process moving2
    loop 
        Input.KeyDown (ch2) 
        if hasch then 
        elsif h2 < 1  then 
            h2 := 1199 
            Sprite.Show (LightC4) 
            Sprite.SetPosition (LightC4, h2, v2, true)
        elsif h2 > 1200 then 
            h2 := 2 
            Sprite.Show (LightC4) 
            Sprite.SetPosition (LightC4, h2, v2, true)
        elsif v2 < 1 then 
            v2 := 899 
            Sprite.Show (LightC4)
            Sprite.SetPosition (LightC4, h2, v2, true)
        elsif v2 > 898 then 
            v2 := 2
            Sprite.Show (LightC4)
            Sprite.SetPosition (LightC4, h2, v2, true)
            %This group of statements can be removed to ad extra mechanics to the game 
        elsif cx < 1 then 
            cx := 1199
        elsif cx > 1200 then 
            cx := 2 
        elsif cy < 1 then 
            cy := 899 
        elsif cy > 898 then 
            cy := 2
            %//////////////////////////////////////////////////////////////////////////
        else 
            Sprite.Show (LightC3)
            Sprite.Hide (LightC4) 
            Sprite.SetPosition (LightC3, h2, v2, true)
        end if
        if ch2 ('w') then 
            Sprite.Show (LightC4) 
            Sprite.Hide (LightC3) 
            v2 +=5
            Sprite.SetPosition (LightC4, h2, v2, true)
        elsif ch2 ('s') then 
            Sprite.Show (LightC4) 
            Sprite.Hide (LightC3) 
            v2 -=5
            Sprite.SetPosition (LightC4, h2, v2, true)
        else 
            Sprite.Show (LightC3) 
            Sprite.Hide (LightC4) 
            Sprite.SetPosition (LightC3, h2, v2, true)
        end if
        if ch2 ('d') then 
            Sprite.Show (LightC4) 
            Sprite.Hide (LightC3) 
            h2 +=5
            Sprite.SetPosition (LightC4, h2, v2, true)
        elsif ch2 ('a') then 
            Sprite.Show (LightC4) 
            Sprite.Hide (LightC3) 
            h2 -=5
            Sprite.SetPosition (LightC4, h2, v2, true)
        else 
            Sprite.Show (LightC3) 
            Sprite.Hide (LightC4) 
            Sprite.SetPosition (LightC3, h2, v2, true)
        end if
        delay(pace2)
        exit when gameOver1
    end loop 
end moving2

process L1 
    loop
        C1 := 7
        %randint (C1, 51, 56)
        Draw.ThickLine (h1, v1, x1 + 600, y1 + 450, 2, 54)
        delay (5)
        Draw.ThickLine (h1, v1, x1 + 600, y1 + 450, 8, C1)
        exit when gameOver1 or chase
    end loop
end L1

process L2 
    loop
        C2 := 7
        %randint (C2, 39, 44)
        Draw.ThickLine (h2, v2, x1 - 600, y1 + 450, 2, 42)
        delay (5)
        Draw.ThickLine (h2, v2, x1 - 600, y1 + 450, 8, C2)
        exit when gameOver1 or chase 
    end loop
end L2

process Chase
    cx := 600 
    cy := 450
    Sprite.SetPosition (Core, cx, cy, true)
    loop 
        if Math.Distance (h1, v1, cx, cy) < 60 then 
            cx := h1 
            cy := v1 
            carrier := "blue" 
            Sprite.SetPosition (Core, cx, cy, true) 
        end if
        if Math.Distance (h2, v2, cx, cy) < 60 then 
            cx := h2 
            cy := v2
            carrier := "red"
            Sprite.SetPosition (Core, cx, cy, true) 
        end if
        exit when gameOver1 
    end loop
    if gameOver1 then 
        if finalTime1B = 15 then 
            Sprite.Hide (LightC)
            Sprite.Hide (LightC2)
            Sprite.Hide (LightC3)
            Sprite.Hide (LightC4)
            for i : 1 .. 12 
                Pic.ScreenLoad ("ex1"+ intstr (i)+".bmp", h2 - 30, v2 - 30, picMerge)
                delay (200)
            end for
                Sprite.Hide (Core) 
            Sprite.Hide (sB2) 
            GUI.SetBackgroundColor (7)
            moveText ("Blue Box wins", 0.5, 450, font4, 53)
            colourM := 53
            colourS := 54
            enemyC := 42
        elsif finalTime1R = 15 then 
            Sprite.Hide (LightC)
            Sprite.Hide (LightC2)
            Sprite.Hide (LightC3)
            Sprite.Hide (LightC4)
            for i : 1 .. 12 
                Pic.ScreenLoad ("ex1"+ intstr (i)+".bmp", h1 - 30, v1 - 30, picMerge)
                delay (200)
            end for
                Sprite.Hide (Core) 
            Sprite.Hide (sB2) 
            GUI.SetBackgroundColor (7) 
            moveText ("Red Box wins", 0.5, 450, font4, 42)
            colourM := 42 
            colourS := 41
            enemyC := 53
        end if
    end if
end Chase

process speedBoost1 
    pace1 := 10
    pace2 := 10
    sbx1 := 0
    sby1 := 0
    loop
        randint (sbx1, 5, 595)
        randint (sby1, 5, 520)
        Sprite.Show (sB2)
        Sprite.SetPosition (sB2, sbx1, sby1, true)
        loop 
            if Math.Distance(h1, v1, sbx1 + 10, sby1 + 13) < 40 then 
                Sprite.Hide (sB2)
                pace1 := 6
            elsif Math.Distance(h2, v2, sbx1 + 10, sby1 + 13) < 40 then 
                Sprite.Hide (sB2)
                pace2 := 6
            end if 
            exit when 
            pace1 = 6 or pace2 = 6
        end loop 
        delay (2500)
        pace1 := 10 
        pace2 := 10 
        exit when 
        gameOver1 or chase 
    end loop 
end speedBoost1 

proc intro1 
    GUI.SetBackgroundColor (7)
    Sprite.Show (LightC) 
    Sprite.SetPosition (LightC, 800, 450, true) 
    Sprite.Show (LightC3)
    Sprite.SetPosition (LightC3, 400, 450, true)  
    Sprite.Show (Core) 
    Sprite.SetPosition (Core, 600, 450, true)
    moveText ("Click to begin", 0.5, 200, font4, 0) 
    moveText ("green", 0.8, 800, font4, brightgreen)
    moveText ("The box that holds the           core", 0.5, 800, font4, 0)
    moveText ("for 15 seconds", 0.5, 700, font2, 0)
    moveText ("shall proceed to the next stage", 0.5, 600, font2, 0)
    Pic.ScreenLoad ("controlB.bmp", 940, 320, picMerge)
    Pic.ScreenLoad ("controlR.bmp", 140, 320, picMerge)
    buttonwait ("down", x1, y1, z1, z1) 
    x1 := 600
    y1 := 0
    GUI.SetBackgroundColor (7) 
    if buttonmoved ("down") then 
        beginGame := true 
    end if
end intro1

proc game1
    h1 := 800 
    v1 := 450
    
    h2 := 400 
    v2 := 450
    
    intro1
    fork L1music
    fork speedBoost1
    fork TimerB
    fork TimerR
    fork Chase
    fork moving1 
    fork moving2
    %..........................
    %These two processes can be removed to reduce animations
    fork L1
    fork L2
    %..........................
end game1
%.......................................................................................................Level 2 
proc intro 
    moveText ("Survive by collecting energy", 0.5, 750, font2, colourM)
    moveText ("and collecting bits", 0.5, 600, font2, colourM)
    drawbox (450, 238, 750, 290, colourS)
    moveText ("Continue", 0.5, 250, font2, colourM)
    loop 
        buttonwait ("down", x, y, z, z) 
        exit when 
        x > 440 & x < 750 & y > 238 & y < 290 
    end loop 
    GUI.SetBackgroundColor (black)
    Pic.ScreenLoad ("bit.bmp", 420, 700, picMerge)
    moveText ("+ 15 bits", 0.52, 700, font2, colourM)
    if carrier = "blue" then 
        Pic.Draw (sbb, 420, 500, picMerge)  
    elsif carrier = "red" then 
        Pic.Draw (sbr, 420, 500, picMerge)  
    end if
    moveText ("+ 25 Energy", 0.55, 500, font2, colourM)
    drawbox (450, 85, 750, 140, colourS) 
    moveText ("Play", 0.5, 100, font2, colourM)
    loop 
        buttonwait ("down", x, y, z, z) 
        exit when 
        x > 450 & x < 750 & y > 85 & y < 140 
    end loop 
    cls
    beginGame := true 
end intro

process timer 
    startTime := 0 
    startTime := Time.Elapsed
    drawbox (920, 825, 1192, 900, colourS) 
    moveText ("Time:   ", 0.9, 850, font2, colourM) 
    loop
        finalTime := (Time.Elapsed - startTime) div 1000
        drawfillbox (1080, 835, 1180, 899, black)
        moveText (intstr (finalTime), 0.97, 850, font2, colourM)
        delay (1000)
        exit when 
        gameOver 
    end loop 
end timer

process movingB
    pace := 15
    loop 
        Input.KeyDown (ch) 
        if hasch then 
        elsif h < 1  then 
            h := 1199
            Sprite.Show (LightC2) 
            Sprite.SetPosition (LightC2, h, v, true)
        elsif h > 1200 then 
            h := 2 
            Sprite.Show (LightC2) 
            Sprite.SetPosition (LightC2, h, v, true)
        elsif v < 1 then 
            v := 809 
            Sprite.Show (LightC2)
            Sprite.SetPosition (LightC2, h, v, true)
        elsif v > 810 then 
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
        exit when gameOver
    end loop 
    if gameOver = true then 
        delay (500)
        Sprite.Hide (LightC)
    end if
end movingB

process movingR
    pace := 15
    loop 
        Input.KeyDown (ch) 
        if hasch then 
        elsif h < 1  then 
            h := 1199
            Sprite.Show (LightC4) 
            Sprite.SetPosition (LightC4, h, v, true)
        elsif h > 1200 then 
            h := 2 
            Sprite.Show (LightC4) 
            Sprite.SetPosition (LightC4, h, v, true)
        elsif v < 1 then 
            v := 809 
            Sprite.Show (LightC4)
            Sprite.SetPosition (LightC4, h, v, true)
        elsif v > 810 then 
            v := 2
            Sprite.Show (LightC4)
            Sprite.SetPosition (LightC4, h, v, true)
        else 
            Sprite.Show (LightC3)
            Sprite.Hide (LightC4) 
            Sprite.SetPosition (LightC3, h, v, true)
        end if
        if ch ('w') then
            Sprite.Show (LightC4)
            Sprite.Hide (LightC3)
            v +=5
            Sprite.SetPosition (LightC4, h, v, true)
        elsif ch ('s') then
            Sprite.Show (LightC4)
            Sprite.Hide (LightC3)
            v -=5 
            Sprite.SetPosition (LightC4, h, v, true)
        else 
            Sprite.Show (LightC3) 
            Sprite.Hide (LightC4) 
            Sprite.SetPosition (LightC3, h, v, true)
        end if
        if ch ('d') then 
            Sprite.Show (LightC4) 
            Sprite.Hide (LightC3) 
            h +=5
            Sprite.SetPosition (LightC4, h, v, true)
        elsif ch ('a') then 
            Sprite.Show (LightC4) 
            Sprite.Hide (LightC3) 
            h -=5
            Sprite.SetPosition (LightC4, h, v, true)
        else 
            Sprite.Show (LightC3) 
            Sprite.Hide (LightC4) 
            Sprite.SetPosition (LightC3, h, v, true)
        end if
        delay(pace)
        exit when gameOver
    end loop 
    if gameOver = true then 
        delay (500)
        Sprite.Hide (LightC3)
    end if
end movingR

process movingTR
    torx2 := torx1 + 200
    tory2 := tory1 + 200
    loop 
        Input.KeyDown (chTR) 
        if hasch then 
        elsif torx1 < 1  then 
            torx1 := 1199
            Sprite.SetPosition (torN, torx1, 0, false) 
            Sprite.SetPosition (torS, torx1 + 200, 797, false) 
        elsif torx1 > 1200 then 
            torx1 := 2 
            Sprite.SetPosition (torN, torx1, 0, false) 
            Sprite.SetPosition (torS, torx1 + 200, 797, false)
        elsif tory1 < 1 then 
            tory1 := 809 
            Sprite.SetPosition (torE, 0, tory1, false)
            Sprite.SetPosition (torW, 1172, tory1 - 200, false)
        elsif tory1 > 810 then 
            tory1 := 2
            Sprite.SetPosition (torE, 0, tory1, false)
            Sprite.SetPosition (torW, 1172, tory1 - 200, false)
        end if
        if chTR (KEY_UP_ARROW) then
            Sprite.Show (torE)
            Sprite.Show (torW)
            Sprite.SetPosition (torE, 0, tory1, false)
            Sprite.SetPosition (torW, 1172, tory1 - 200, false)
            tory1 +=5
        elsif chTR (KEY_DOWN_ARROW) then
            Sprite.Show (torE)
            Sprite.Show (torW)
            Sprite.SetPosition (torE, 0, tory1, false)
            Sprite.SetPosition (torW, 1172, tory1 - 200, false)
            tory1 -=5 
        end if
        if chTR (KEY_RIGHT_ARROW) then 
            Sprite.Show (torN) 
            Sprite.Show (torS)
            Sprite.SetPosition (torN, torx1, 0, false) 
            Sprite.SetPosition (torS, torx1 + 200, 797, false) 
            torx1 +=5
        elsif chTR (KEY_LEFT_ARROW) then 
            Sprite.Show (torN) 
            Sprite.Show (torS)
            Sprite.SetPosition (torN, torx1, 0, false) 
            Sprite.SetPosition (torS, torx1 + 200, 797, false) 
            torx1 -=5
        end if
        delay(20)
        exit when gameOver
    end loop 
end movingTR

process movingTB
    torx2 := torx1 + 200
    tory2 := tory1 + 200
    loop 
        Input.KeyDown (chTB) 
        if hasch then 
        elsif torx1 < 1  then 
            torx1 := 1199
            Sprite.SetPosition (torN, torx1, 0, false) 
            Sprite.SetPosition (torS, torx1 + 200, 797, false) 
        elsif torx1 > 1200 then 
            torx1 := 2 
            Sprite.SetPosition (torN, torx1, 0, false) 
            Sprite.SetPosition (torS, torx1 + 200, 797, false)
        elsif tory1 < 1 then 
            tory1 := 809 
            Sprite.SetPosition (torE, 0, tory1, false)
            Sprite.SetPosition (torW, 1172, tory1 - 200, false)
        elsif tory1 > 810 then 
            tory1 := 2
            Sprite.SetPosition (torE, 0, tory1, false)
            Sprite.SetPosition (torW, 1172, tory1 - 200, false)
        end if
        if chTB ('w') then
            Sprite.Show (torE)
            Sprite.Show (torW)
            Sprite.SetPosition (torE, 0, tory1, false)
            Sprite.SetPosition (torW, 1172, tory1 - 200, false)
            tory1 +=5
        elsif chTB ('s') then
            Sprite.Show (torE)
            Sprite.Show (torW)
            Sprite.SetPosition (torE, 0, tory1, false)
            Sprite.SetPosition (torW, 1172, tory1 - 200, false)
            tory1 -=5 
        end if
        if chTB ('d') then 
            Sprite.Show (torN) 
            Sprite.Show (torS)
            Sprite.SetPosition (torN, torx1, 0, false) 
            Sprite.SetPosition (torS, torx1 + 200, 797, false) 
            torx1 +=5
        elsif chTB ('a') then 
            Sprite.Show (torN) 
            Sprite.Show (torS)
            Sprite.SetPosition (torN, torx1, 0, false) 
            Sprite.SetPosition (torS, torx1 + 200, 797, false) 
            torx1 -=5
        end if
        delay(20)
        exit when gameOver
    end loop 
end movingTB

process lasers 
    loop
        drawfillbox (0, 0, 1200, 824, 7)
        delay (1500)
        Draw.ThickLine (torx1 + 14, 28, torx1 + 14, 815, 15, enemyC)
        Draw.ThickLine (torx1 + 200, 795, torx1 + 200, 0, 15, enemyC)
        Draw.ThickLine (28, tory1 + 13, 1200, tory1 + 13, 15, enemyC)
        Draw.ThickLine (0, tory1 - 200, 1170, tory1 - 200, 15, enemyC)
        
        delay (3000)
        
        exit when gameOver or hp < hpB or hp < 194
    end loop
end  lasers 

process actualScore
    drawbox (620, 825, 910, 900, colourS) 
    moveText ("Score:   ", 0.62, 850, font2, colourM) 
    loop
        drawfillbox (800, 835, 900, 899, black) 
        moveText (intstr (score), 0.72, 850, font2, colourM) 
        delay(200)
        exit when gameOver 
    end loop 
    
    if gameOver & nothighscore = true then 
        Sprite.Hide (LightC)
        Sprite.Hide (LightC2)
        Sprite.Hide (LightC3)
        Sprite.Hide (LightC4)
        Sprite.Hide (sBB)
        Sprite.Hide (sBR)
        Sprite.Hide (Bit)
        Sprite.Hide (torN)
        Sprite.Hide (torS)
        Sprite.Hide (torE)
        Sprite.Hide (torW)
        delay (500)
        GUI.SetBackgroundColor (7)
        moveText ("Your score is", 0.5, 750, font2, colourS) 
        moveText (intstr (score), 0.5, 630, font2, colourM)
        drawbox (300, 278, 900, 345, colourS) 
        moveText ("Play Again", 0.5,300,font,colourM)
        drawbox (1120, 840, 1194, 896, colourS)
        moveText ("X", 0.98, 855, font2, 39)
        drawbox (300, 53, 900, 120, colourS) 
        moveText ("High Scores", 0.5, 75, font, colourM)
    end if
end actualScore 

process EnergyIB 
    pace := 15
    sbx := 0
    sby := 0
    loop
        randint (sbx, 5, 1195)
        randint (sby, 5, 820)
        Sprite.Show (sBB)
        Sprite.SetPosition (sBB, sbx, sby, true)
        loop 
            if Math.Distance(h, v, sbx + 10, sby + 13) < 40 then 
                ecount := 0
                Sprite.Hide (sBB)
                pace := 8
                loop 
                    hp += 1
                    drawfillbox(194, 836, 594, 888, 7)
                    drawfillbox(hpB, 836, hp, 888, colourM)
                    delay (15)
                    ecount += 1
                    exit when ecount = 60 or hp = 594   
                end loop
            end if 
            exit when 
            pace = 8 
        end loop 
        delay (2000)
        pace := 15 
        exit when 
        gameOver
    end loop 
end EnergyIB

process EnergyIR
    pace := 15
    sbx := 0
    sby := 0
    loop
        randint (sbx, 5, 1195)
        randint (sby, 5, 820)
        Sprite.Show (sBR)
        Sprite.SetPosition (sBR, sbx, sby, true)
        loop 
            if Math.Distance(h, v, sbx + 10, sby + 13) < 40 then 
                ecount := 0
                Sprite.Hide (sBR)
                pace := 8
                loop 
                    hp += 1
                    drawfillbox(194, 836, 594, 888, 7)
                    drawfillbox(hpB, 836, hp, 888, colourM)
                    delay (15)
                    ecount += 1
                    exit when ecount = 60 or hp = 594   
                end loop
            end if 
            exit when 
            pace = 8 
        end loop 
        delay (2000)
        pace := 15 
        exit when 
        gameOver
    end loop 
end EnergyIR

process Energy 
    drawbox (2, 825, 608, 900, colourS)
    drawfillbox (1062, 827, 1199, 899, black)
    moveText("Energy:", 0.02, 850, font2, colourM)
    loop
        hp -= 1
        drawfillbox(194, 836, 594, 888, 7)
        drawfillbox(hpB, 836, hp, 888, colourM)
        delay (100)
        if hp = hpB or hp = 194 then 
            gameOver := true 
        end if
        exit when gameOver or hp = hpB or hp = 194 or hp < hpB or hp < 194 
    end loop
end Energy

process damageB 
    drawfillbox(hpB, 836, hp, 888, 77) 
    loop
        if whatdotcolour (h, v) = enemyC then 
            hp -=2
            drawfillbox(194, 836, 594, 888, 7)
            drawfillbox(hpB, 836, hp, 888, enemyC)
            delay (3)
        end if
        if hp = hpB or hp = 194 or hp < hpB or hp < 194 then 
            gameOver := true 
        end if
        exit when gameOver 
    end loop
end damageB

process damageR
    drawfillbox(hpB, 836, hp, 888, 77) 
    loop
        if whatdotcolour (h, v) = enemyC then 
            hp -=2
            drawfillbox(194, 836, 594, 888, 7)
            drawfillbox(hpB, 836, hp, 888, enemyC)
            delay (3)
        end if
        if hp = hpB or hp = 194 or hp < hpB or hp < 194 then 
            gameOver := true 
        end if
        exit when gameOver 
    end loop
end damageR

process Bits 
    Bx := 0
    By := 0
    loop
        randint (Bx, 5, 1195)
        randint (By, 5, 820)
        Sprite.Show (Bit)
        Sprite.SetPosition (Bit, Bx, By, true)
        loop 
            if h > Bx & h < Bx + 24 & v > By & v < By + 24 or Math.Distance(h, v, Bx + 12, By + 12) < 20 then 
                score += 15
                Sprite.Hide (Bit)
            end if 
            exit when 
            h > Bx & h < Bx + 24 & v > By & v < By + 24 or Math.Distance(h, v, Bx + 12, By + 12) < 20
        end loop 
        exit when 
        gameOver
    end loop 
end Bits

proc saveFile
    open : FileNum, ("Scores"), write 
    write : FileNum, newUser 
    close : FileNum 
end saveFile

proc scoreScreen 
    GUI.SetBackgroundColor(7)
    moveText ("High Scores", 0.5, ys + 135, font, colourM)
    moveText ("#                            Name                                            Score", 0.25, ys + 68, font, colourM)
    for i : 1 .. 10 
        moveText (intstr (i), 0.1, ys - 8, font, colourM) 
        moveText (newUser(i).userName, 0.3, ys - 8, font, colourM)
        moveText (intstr (newUser(i).score), 0.7, ys - 8, font, colourM)
        ys -=70
        delay (100)
    end for
end scoreScreen

proc changeScreenReset
    loop 
        buttonwait ("down", x, y, z, z) 
        exit when 
        x > 10 & x < 1110 & y > 112.5 & y < 892.2
    end loop
    if  x > 10 & x < 1110 & y > 112.5 & y < 892.5 then 
        GUI.SetBackgroundColor (7)
    elsif x > 1050 & x < 1190 & y > 787.5 & y < 892.5 then 
        for i : 1 .. 11 
            newUser(i).score := 0 
            newUser(i).userName := " " 
        end for 
            saveFile 
    end if
end changeScreenReset

proc introduction
    fork intromusic
    GUI.SetBackgroundColor (7)
    moveText ("A few years ago", 0.5, 700, font4, 0)
    moveText (" a new digital world was born", 0.5, 550, font4, 0)
    delay (3000)
    moveText ("and with it, a rivalry began", 0.5, 400, font4, 0)
    delay (3000)
    Pic.ScreenLoad ("LightC.bmp", 400, 200, picMerge)
    Pic.ScreenLoad ("LightC3.bmp", 800, 200, picMerge)
    delay (4000)
    musicstopi := true
end introduction
%.........................................................................................................................................Game 
introduction 

game1
loop
    if gameOver1 then 
        delay (4000)
        musicstop1 := true 
        secondL := true 
    end if
    exit when gameOver1 = true & secondL = true 
end loop

if secondL then 
    GUI.SetBackgroundColor (7)
    intro
    GUI.SetBackgroundColour (7)
    loop
        retry := false
        keyfound := false 
        gameOver := false 
        beginGame := false 
        musicstop2 := false 
        highscore := false 
        score := 0 
        hpB := 194 
        hp := 594 
        h := 450 
        v := 600
        
        if carrier = "blue" then 
            Sprite.Show (LightC)
            Sprite.SetPosition (LightC, h, v, true) 
            fork movingB
            fork damageB
            fork EnergyIB
            fork movingTB
        elsif carrier = "red" then 
            Sprite.Show (LightC3)
            Sprite.SetPosition (LightC3, h, v, true) 
            fork movingR
            fork damageR
            fork EnergyIR
            fork movingTR
        end if 
        fork lasers
        fork L2music
        fork timer
        fork actualScore
        fork Bits
        fork Energy
        
        loop
            ys := 700 
            if score > newUser(11).score & gameOver then
                highscore := true 
            elsif score < newUser(11).score & gameOver then 
                nothighscore := true 
            end if
            if highscore & score > newUser(11).score & gameOver then
                Sprite.Hide (LightC)
                Sprite.Hide (LightC2)
                Sprite.Hide (sBB)
                Sprite.Hide (sBR)
                Sprite.Hide (Bit)
                Sprite.Hide (torN)
                Sprite.Hide (torS)
                Sprite.Hide (torE)
                Sprite.Hide (torW)
                GUI.SetBackgroundColor(7)
                moveText ("You made it into the top 10 scores !", 0.5, 520, font, colourM)
                moveText ("Enter your first and last name", 0.5, 480, font, colourM) 
                get newUser(11).userName : * 
                newUser(11).score  := score 
                GUI.SetBackgroundColor (7)
                Sorting  
                scoreScreen
                changeScreenReset
                saveFile
                musicstop2 := true 
            elsif nothighscore then 
                loop
                    buttonwait ("down", x, y, z, z)
                    exit when 
                    x > 300 & x < 900 & y > 53 & y < 120 or x > 1120 & x < 1194 & y > 840 & y < 896 or x > 300 & x < 900 & y > 278 & y < 345 
                end loop 
                if x > 300 & x < 900 & y > 53 & y < 120 then 
                    GUI.SetBackgroundColor (7)
                    musicstop2 := true
                    scoreScreen
                    changeScreenReset
                    saveFile
                end if 
                exit when 
                x > 1120 & x < 1194 & y > 840 & y < 896 or x > 300 & x < 900 & y > 278 & y < 345 
            end if
            exit when 
            x > 1120 & x < 1194 & y > 840 & y < 896 
        end loop
        exit when 
        x > 1120 & x < 1194 & y > 840 & y < 896  
    end loop 
    Window.Close (summativeP)
    musicstop2 := true
    Music.PlayFileStop  
end if

