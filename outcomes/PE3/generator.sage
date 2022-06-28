class Generator(BaseGenerator):
    def data(self):
        vr = ['a', 'b', 'c', 'k', 'm', 'n', 'p', 'q', 't', 'v', 'x', 'y']
        shuffle(vr)
        x = var(vr[0])

        [a,b] = [1,1]
        clist = [1,1,1,1,1,1]
        while(abs(a)==abs(b) or len(set(clist))<6):
            k = [randint(1,10)*choice([-1,1]), randint(1,10)*choice([-1,1])]
            k.sort()
            [a,b] = k
            clist=[
                (x+a)*(x+b),
                (x-a)*(x-b),
                (x+a)*(x-b),
                x*(x+a+b),
                (a*x)*(b*x),
                (x+a+b)^2
            ]
        answer = clist[0]
        
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
            "expanded": expand((x+a)*(x+b)),
            "answer": answer,
            "choices": ch
        }
