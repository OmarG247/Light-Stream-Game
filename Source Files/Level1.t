import GUI
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

proc moveText (text : string, alignment : real, y, font, hintTextC : int)
    Font.Draw (text,
        round (alignment * (maxx - Font.Width (text, font))), y,
        font, hintTextC)
end moveText

process Timer 
    finalTime1 := 0
    loop
        finalTime1 +=1 
        drawfillbox (1050, 780, 1260, 900, 7)
        moveText(realstr(finalTime1, 2), 0.97, 810, font4, 53)
        delay (1000)
        if  finalTime1 = 30 then 
            gameOver1 := true 
        end if
        exit when 
        gameOver1 = true 
    end loop 
end Timer

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
        elsif cx < 1 then 
            cx := 1199
        elsif cx > 1200 then 
            cx := 2 
        elsif cy < 1 then 
            cy := 899 
        elsif cy > 898 then 
            cy := 2
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
        elsif cx < 1 then 
            cx := 1199
        elsif cx > 1200 then 
            cx := 2 
        elsif cy < 1 then 
            cy := 899 
        elsif cy > 898 then 
            cy := 2
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
        randint (C1, 51, 56)
        Draw.ThickLine (h1, v1, x1 + 600, y1 + 450, 2, 54)
        delay (5)
        Draw.ThickLine (h1, v1, x1 + 600, y1 + 450, 8, C1)
        exit when gameOver1 or chase
    end loop
end L1

process L2 
    loop
        C2 := 7
        randint (C2, 39, 44)
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
        if Math.Distance (h1, v1, cx, cy) < 40 then 
            cx := h1 
            cy := v1 
            carrier := "blue" 
            Sprite.SetPosition (Core, cx, cy, true) 
        end if
        if Math.Distance (h2, v2, cx, cy) < 40 then 
            cx := h2 
            cy := v2
            carrier := "red" 
            Sprite.SetPosition (Core, cx, cy, true) 
        end if
        exit when gameOver1 
    end loop
    if gameOver1 then 
        if carrier = "blue" then 
            Sprite.Hide (LightC3)
            Sprite.Hide (LightC4)
            for i : 1 .. 15 
                Pic.ScreenLoad ("ex1"+ intstr (i)+".bmp", h2 - 30, v2 - 30, picMerge)
                delay (200)
            end for
                Sprite.Hide (LightC2)
            Sprite.Hide (Core) 
            Sprite.Hide (sB2) 
            GUI.SetBackgroundColor (7)
            moveText ("Blue Box wins", 0.5, 450, font4, 53)
        elsif carrier = "red" then 
            Sprite.Hide (LightC)
            Sprite.Hide (LightC2)
            for i : 1 .. 15 
                Pic.ScreenLoad ("ex1"+ intstr (i)+".bmp", h1 - 30, v1 - 30, picMerge)
                delay (200)
            end for
                Sprite.Hide (LightC4)
            Sprite.Hide (Core) 
            Sprite.Hide (sB2) 
            GUI.SetBackgroundColor (7) 
            moveText ("Red Box wins", 0.5, 450, font4, 42)
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
    moveText ("Click to begin", 0.5, 200, font4, 53) 
    moveText ("green", 0.76, 800, font4, brightgreen)
    moveText ("The box holding the           core", 0.5, 800, font4, 53)
    moveText ("after 30 seconds", 0.5, 700, font, 53)
    moveText ("shall proceed to the next stage", 0.5, 600, font, 53)
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
    fork speedBoost1
    fork Timer
    fork Chase
    fork moving1 
    fork moving2
    fork L1
    fork L2
end game1

game1