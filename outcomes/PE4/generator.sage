class Generator(BaseGenerator):
    def data(self):
        vr = ['a', 'b', 'c', 'k', 'm', 'n', 'p', 'q', 't', 'v', 'x', 'y']
        shuffle(vr)
        x = var(vr[0])
        [a,b,c,d]=[1,1,1,1]
        clist = [
            a*x+b,
            a*x+b*c,
            a*c*x+b,
            a*x^(d+1)+b,
            a*x+b*x^d,
            a*x+b*c*x^d
        ]
        while(len(set(clist))<6):
            [a,b] = [randint(1,6)*choice([-1,1]),randint(1,6)*choice([-1,1])] # Answer: ax + b
            [c,d] = [randint(2,6)*choice([-1,1]),randint(1,6)] # GCF: cx^d

            clist = [
                a*x+b,
                a*x+b*c,
                a*c*x+b,
                a*x^(d+1)+b,
                a*x+b*x^d,
                a*x+b*c*x^d
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
            "num": expand(c*x^d*(a*x+b)),
            "den": c*x^d,
            "answer": a*x + b,
            "choices": ch
        }
