class Generator(BaseGenerator):
    def data(self):
        vr = ['k', 'm', 'n', 'p', 'q', 'r', 't', 'v', 'w', 'x', 'y']
        shuffle(vr)
        v = vr[0]
        var(v)
        [a,b,c,d,e] = [1,2,3,2,3]
        ans = 1
        clist = [ans, QQ((d-b)/(a-c)), QQ((c*(d-a*b))/a), QQ((c*(d-b))/a),QQ((d+a*b)/(a-c)),QQ((d-a*b)/(a+c))]

        while(abs(a) == abs(c) or abs(d) == abs(b) or abs(a*b) > 100 or ans.denominator()>2 or len(set(clist))<6 ):
            #a = QQ(randint(1,12)*choice([-1,1])/randint(1,6))
            a = randint(2,12)*choice([-1,1])
            b = randint(1,72)*choice([-1,1])
            c = randint(2,12)*choice([-1,1])
            d = randint(1,10)*choice([-1,1])
            e = randint(1,10)*choice([-1,1])
            if(abs(a)==abs(c)):
                continue
            else:
                ans = solve(a*(x+b)==c*x+d, x)[0].rhs()
                clist = [ans, QQ((d-b)/(a-c)), QQ((c*(d-a*b))/a), QQ((c*(d-b))/a),QQ((d+a*b)/(a-c)),QQ(d/(a-c)-a*b)]
                dist = QQ((d-b)/(a-c))
                dist2 = QQ(d/(a-c)-a*b)
        var('x')
        
        if(e>0):
            op = "+"
        else:
            op = "-"
        
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
            "var":  v,
            "a": a,
            "b": var(v) + b, 
            "c": c*var(v) + d,
            "et": abs(e),
            "answer": ans,
            "choices": ch,
            "op": op,
            "l": len(set(clist)),
            "distractor": dist,
            "distractor2": dist2,
            "bx": var(v),
            "bc": b,
            "lhs": a*var(v) + a*b,
            "lx": a*var(v),
            "rx": c*var(v),
            "sop": "-" if c>0 else "+",
            "soping": "subtracting" if c > 0 else "adding",
            "subadd": "or, in other words, add "+str(abs(c))+str(v) if c < 0 else "",
            "rrx": abs(c)*var(v),
            "llhs": (a-c)*var(v) + a*b,
            "rrhs": d,
            "amc": a-c,
            "ab": a*b,
            "oping": "subtracting" if a*b > 0 else "adding",
            "op": "-" if a*b > 0 else "+",
            "aab": abs(a*b),
            "lllhs": (a-c)*var(v),
            "rrrhs": d-a*b
            
        }
