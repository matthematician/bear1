class Generator(BaseGenerator):
    def data(self):
        vnames = ['k', 'm', 'n', 'p', 'q', 'r', 't', 'v', 'x', 'y']
        sgns = ['\\lt', '\\leq', '\\geq', '\\gt']
        shuffle(vnames)
        i = randrange(0,4)
        [v,sgn] = [vnames[0],sgns[i]]
        
        [a,b,c]=[3,1,1]
        var('x')
        ans = QQ(b/(c-a))
        while(a==c or c==0 or ans.denominator()>1 or abs(abs(a)-abs(c))<2 or a*b > 100):
            a = randint(2,12)*choice([-1,1])
            b = randint(2,24)*choice([-1,1])
            c = randint(a,12)
            if(a==c):
                continue
            else:
                ans = QQ(b/(c-a))
        
        clist = [
            '(-\\infty,'+str(ans)+')',
            '(-\\infty,'+str(ans)+']',
            '['+str(ans)+',\\infty)',
            '('+str(ans)+',\\infty)',
            '['+str(-1*abs(ans))+','+str(abs(ans))+']',
            '('+str(-1*abs(ans))+','+str(abs(ans))+')',
        ]
        
        if(a > c):
            answer = clist[i]
        else:
            answer = clist[3-i]
        
        shuffle(clist)
            
        
        ch = [
            {'letter': 'a', 'interval': clist[0]},
            {'letter': 'b', 'interval': clist[1]},
            {'letter': 'c', 'interval': clist[2]},
            {'letter': 'd', 'interval': clist[3]},
            {'letter': 'e', 'interval': clist[4]},
            {'letter': 'f', 'interval': clist[5]}
        ]
        
        
        
        
        return {
            "a": a*var(v) + b,
            "c": c*var(v),
            "choices": ch,
            "interval": answer,
            "sgn": sgn
        }
