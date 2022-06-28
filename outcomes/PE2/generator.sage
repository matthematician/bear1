class Generator(BaseGenerator):
    def data(self):
        vr = ['a', 'b', 'c', 'k', 'm', 'n', 'p', 'q', 't', 'v', 'x', 'y']
        shuffle(vr)
        [x,y] = [var(vr[0]), var(vr[1])]

        [a,b]=[1,1]
        clist = [
            1,1,1,1,1,1
        ]
        while(a==b or len(set(clist))<6 ):
            a = randint(1,5)*choice([-1,1])
            b = randint(1,2*a^2)*choice([-1,1])
            clist = [
                expand((x-a*y)*(x^2+a*x*y+b*y^2)),
                expand((x+a*y)*(x^2-a*x*y+b*y^2)),
                x^3 -a^2*y^2 + b*x + a*b*y,
                x^2 - a^2*y^2 + b*x + a*b*y,
                expand((x+a*y)*(x^2+a*x*y+b*y^2)),
                expand((x-a*y)*(x^2-a*x*y-b*y^2))
                
            ]
            
        answer= clist[0]

        shuffle(clist)

        ch = [
            {'letter': 'a', 'value': clist[0]},
            {'letter': 'b', 'value': clist[1]},
            {'letter': 'c', 'value': clist[2]},
            {'letter': 'd', 'value': clist[3]},
            {'letter': 'e', 'value': clist[4]},
            {'letter': 'f', 'value': clist[5]},
        ]
        
        return {
            "p1": x-a*y,
            "p2": x^2+a*x*y+b*y^2,
            "choices": ch,
            "answer": answer
        }
