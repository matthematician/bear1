class Generator(BaseGenerator):
    def data(self):
        vr = ['a', 'b', 'c', 'k', 'm', 'n', 'p', 'q', 't', 'v', 'x', 'y']
        shuffle(vr)
        x = var(vr[0])

        # Pick a perfect square up to 100
        r = randint(1,10)
        
        # Pick whether to use x^2 - r or r - x^2
        if(choice([True,False])):
            lhs = x^2 - r^2
        else:
            lhs = str(r^2)+'-'+str(x)+'^2'
        
        clist = [
            0,
            r,
            -1*r,
            r^2,
            -1*r^2
        ]
        
        
        answer= clist[0]
        shuffle(clist)
        clist = clist + ['\\text{This equation has no solutions.}']
        ch = [
            {'letter': 'a', 'value': clist[0]},
            {'letter': 'b', 'value': clist[1]},
            {'letter': 'c', 'value': clist[2]},
            {'letter': 'd', 'value': clist[3]},
            {'letter': 'e', 'value': clist[4]},
            {'letter': 'f', 'value': clist[5]},
        ]
        
        return {
            "lhs": lhs,
            "choices": ch,
            "answer": answer
            
        }
