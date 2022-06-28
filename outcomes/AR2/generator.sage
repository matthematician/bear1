class Generator(BaseGenerator):
    def data(self):
        [v,w,x,y]=[1,2,1,2]
        [p,q] = [QQ(v/w), QQ(x/y)]
        while(v*y == w*x or w == y or gcd(w,y)<3 or w*y>100 or p.denominator()<3 or q.denominator()<3):
            [w,y] = [randint(3,48), randint(3,48)]
            [v,x] = [randint(3,w)*choice([-1,1]),randint(3,y)*choice([-1,1])]
            [p,q] = [QQ(v/w), QQ(x/y)]
            [v,w] = [p.numerator(), p.denominator()] # Ensures lowest-terms are used to make distractors as well
            [x,y] = [q.numerator(), q.denominator()]
        
        clist = [p+q, p-q, -p-q, q-p]
        l = lcm(w,y)
        wlist = [w,2*w,3*w,4*w]
        ylist = [y,2*y,3*y,4*y]
        
        
        if( choice([True,False]) ):
            op = "+"
            i = 1
            operation = "addition"
            ans = p+q
            clist = clist + [QQ((v+x)/(w+y)), QQ((v-x)/(w+y))]
            dist = QQ((v+x)/(w+y))
        else:
            op = "-"
            i = -1
            operation = "subtraction"
            ans = p-q
            clist = clist + [QQ((v-x)/(w-y)), QQ((v-x)/(w+y))]
            dist = QQ((v-x)/(w-y))
        
        shuffle(clist)
        
        ch = [
            {'letter': 'a', 'value': clist[0]},
            {'letter': 'b', 'value': clist[1]},
            {'letter': 'c', 'value': clist[2]},
            {'letter': 'd', 'value': clist[3]},
            {'letter': 'e', 'value': clist[4]},
            {'letter': 'f', 'value': clist[5]}
        ]
        
        return {
            "v": p.numerator(),
            "w": p.denominator(),
            "op": op,
            "x": q.numerator(),
            "y": q.denominator(),
            "answer": ans,
            "choices": ch,
            "distractor": dist,
            "operation": operation,
            "wy": w*y,
            "vy": v*y,
            "wx": w*x,
            "pn": v*y + i*w*x,
            "gcf": gcd(v*y + i*w*x, w*y),
            "apn": abs(v*y + i*w*x),
            "pn1": (v*y + i*w*x)/gcd(v*y + i*w*x,w*y),
            "pd1": w*y/gcd(v*y + i*w*x,w*y),
            "lcm": l,
            "wlist": tuple(wlist),
            "ylist": tuple(ylist),
            "dgcf": gcd(w,y),
            "aw": max(w,y),
            "ay": min(w,y),
            "awg": max(w,y)/gcd(w,y),
            "wlcm": lcm(w,y)/w,
            "ww": v*lcm(w,y)/w,
            "ylcm": lcm(w,y)/y,
            "yy": x*lcm(w,y)/y,
            "wwyy": v*lcm(w,y)/w + i*x*lcm(w,y)/y
        }
