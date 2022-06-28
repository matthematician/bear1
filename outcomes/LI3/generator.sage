class Generator(BaseGenerator):
    def data(self):
        var('x y')
        p = vector((-2,2))
        q = vector((5,1))
        m = QQ((p[1]-q[1])/(p[0]-q[0]))
        b = QQ(q[1]-m*q[0])
        n = 1/m
        c = QQ(q[1] - n*q[0])
        clist = [m*x + b, m*x, -1*m*x+b, n*x+c, m*x+c, n*x+b]
        while(p[0]==q[0] or p[1]==q[1] or b == c or abs(m) == 1 or m.denominator()>4 or b.denominator()>4 or len(set(clist))<6):
            p = vector((randint(-10,10),randint(-10,10)))
            q = vector((randint(-10,10),randint(-10,10)))
            if( p[0]==q[0] or p[1]==q[1] ):
                continue
            else:
                m = QQ((p[1]-q[1])/(p[0]-q[0]))
                b = QQ(q[1]-m*q[0])
                n = 1/m
                c = QQ(q[1] - n*q[0])        
                clist = [m*x + b, m*x+c, -m*x+b, n*x+c, -n*x-c, -n*x+c]


        

        shuffle(clist)
        
        ch = [
            {'letter': 'a', 'rhs': clist[0]},
            {'letter': 'b', 'rhs': clist[1]},
            {'letter': 'c', 'rhs': clist[2]},
            {'letter': 'd', 'rhs': clist[3]},
            {'letter': 'e', 'rhs': clist[4]},
            {'letter': 'f', 'rhs': clist[5]},
        ]
        
        return {
            "x1": p[0],
            "y1": p[1],
            "x2": q[0],
            "y2": q[1],
            "choices": ch,
            "answer": m*x+b
        }
