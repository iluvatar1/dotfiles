#!/usr/bin/python                                                                                                                                            

print "@map color 0 to (255, 255, 255), \"white\""
print "@map color 1 to (0, 0, 0), \"black\""

def RGBtoHSV( (R,G,B) , fac = 255.0 ):
    R /= fac
    G /= fac
    B /= fac
    M = max(R,G,B)
    m = min(R,G,B)
    C = M-m
    Hp = 0
    if not C==0:
        if   M==R: Hp = ((G-B)/C)%6
        elif M==G: Hp = (B-R)/C + 2
        elif M==B: Hp = (R-G)/C + 4
    H = Hp*60
    V = M
    S = C/V
    return (H,S,V)

def HSVtoRGB( (H,S,V) ):
    C = V*S
    Hp = H/60
    X = C*(1-abs(Hp%2-1))
    (R1,G1,B1) = (0,0,0)
    if   0<=Hp and Hp<1: (R1,G1,B1) = (C,X,0)
    elif 1<=Hp and Hp<2: (R1,G1,B1) = (X,C,0)
    elif 2<=Hp and Hp<3: (R1,G1,B1) = (0,C,X)
    elif 3<=Hp and Hp<4: (R1,G1,B1) = (0,X,C)
    elif 4<=Hp and Hp<5: (R1,G1,B1) = (X,0,C)
    elif 5<=Hp and Hp<6: (R1,G1,B1) = (C,0,X)
    m = V-C
    (R,G,B) = (R1+m,G1+m,B1+m)
    return (int(255*R),int(255*G),int(255*B))

def HSVGradient(start,stop,num):
    N=int(256/(num-1))
    (h1,s1,v1) = start
    (h2,s2,v2) = stop
    (hs,ss,vs) = ((h2-h1)/float(num-1),(s2-s1)/float(num-1),(v2-v1)/float(num-1))
    for i in range(num):
        (h,s,v) = (h1+i*hs,s1+i*ss,v1+i*vs)
        (r,g,b) = HSVtoRGB( (h,s,v) )
        print "@map color "+str(i+2)+" to "+str((r,g,b))+", \"grad"+str(i+1)+"\""

rgbred, rgbgreen, rgbblue = (255,0,0), (0,255,0), (0,0,255)
hsvred, hsvgreen, hsvblue = RGBtoHSV(rgbred), RGBtoHSV(rgbgreen), RGBtoHSV(rgbblue)

HSVGradient(hsvred,hsvblue,11)
#HSVGradient((0.0,1.0,1.0),(240.0,1.0,1.0),24)
