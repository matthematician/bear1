class Generator(BaseGenerator):
    def data(self):
        vr = ['a', 'b', 'c', 'k', 'm', 'n', 'p', 'q', 't', 'v', 'x']
        shuffle(vr)
        x = var(vr[0])
        
        # Make radicand an odd squarefree number
        radicands = [3, 5, 7, 11, 13, 15, 17, 19, 21, 23, 29, 31, 33, 35, 37, 39, 41, 43, 47, 51, 53, 55, 57, 59]
        shuffle(radicands)
        r = radicands[0]
        
        R.<x,y,z> = PolynomialRing(QQ)
        R._latex_names = [ vr[0], '\\sqrt{'+str(r)+'}', '\\sqrt{'+str(2*r)+'}']
        # Force factor order of answer choices to match prompt (radical coefficient at the end)
        
        clist = [
            2*x*y,
            2*x*z,
            x^2*y,
            x^2*z,
            '\\sqrt{'+str(r)+vr[0]+'}',
            '\\sqrt{'+str(2*r)+vr[0]+'}',
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
            "var": x,
            "r": r,
            "answer": answer,
            "choices": ch
        }
