class Generator(BaseGenerator):
    def data(self):
        import re
        vnames = ['k', 'm', 'n', 'p', 'q', 'r', 't', 'v', 'x', 'y']
        sgns = ['\\lt', '\\leq', '\\geq', '\\gt']
        ftexts = ['less than', 'less than or equal to', 'greater than or equal to', 'greater than']
        shuffle(vnames)
        i = randrange(0,4)
        [v,sgn,oppsgn] = [vnames[0],sgns[i],sgns[3-i]]
        
        [a,b,c]=[3,1,1]
        var('x')
        ans = QQ(b/(c-a))
        while(a==c or c==0 or ans.denominator()>1 or abs(abs(a)-abs(c))<2 or a*b > 100):
            a = randint(2,12)*choice([-1,1])
            b = randint(2,24)*choice([-1,1])
            c = randint(2,12)*choice([-1,1])
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
            [answer,distractor] = [ clist[i], clist[3-i] ]
        else:
            [answer,distractor] = [ clist[3-i], clist[i] ]
        
        shuffle(clist)
            
        m = re.match('[(\\[](.*?),(.*?)[)\\]]',answer)    
        
        
        ch = [
            {'letter': 'a', 'interval': clist[0]},
            {'letter': 'b', 'interval': clist[1]},
            {'letter': 'c', 'interval': clist[2]},
            {'letter': 'd', 'interval': clist[3]},
            {'letter': 'e', 'interval': clist[4]},
            {'letter': 'f', 'interval': clist[5]}
        ]
        
        var('x y')
        
        
        
        return {
            "a": a*var(v) + b,
            "c": c*var(v),
            "m": a,
            "n": b,
            "p": c,
            "pmm": c-a,
            "var": vnames[0],
            "soption": "addition" if a < 0 else "subtraction",
            "soping": "adding" if a < 0 else "subtracting",
            "sop": "+" if a < 0 else "-",
            "am": abs(a),
            "spmm": "negative" if c-a < 0 else "positive",
            "doesitflip": "the inequality keeps its direction" if c-a > 0 else "the inequality will need to reverse",
            "t": ans,
            "choices": ch,
            "interval": answer,
            "sgn": sgn,
            "oppsgn": oppsgn,
            "oppfsgn": sgn if c-a > 0 else oppsgn,
            "fsgn": oppsgn if c-a > 0 else sgn,
            "distractor": distractor,
            "ftext": ftexts[3-i] if c-a > 0 else ftexts[i],
            "includ": "is not included" if (i==0 or i==3) else "is included",
            "circtype": "an open circle" if i^2-3*i == 0 else "a filled-in circle",
            "ibrack": "round parenthesis" if i^2-3*i == 0 else "square bracket",
            "xmin": 3*abs(ans),
            "endpt": -3*abs(ans) if ((c-a > 0 and i > 1) or (c-a < 0 and i<2)) else 3*abs(ans),
            "ccolor": 'white' if i^2-3*i == 0 else 'blue',
            "lend" : m.group(1),
            "rend": m.group(2)
        }
    @provide_data
    def graphics(data):
    # updated by clontz
        return {
            "numline": arrow((data['t'],0),(data['endpt'],0),thickness=9, axes=True,ticks=[[0,data['t']],[]], xmin=-1*data['xmin'],xmax=data['xmin'],ymin=-0.5, ymax=0.5,aspect_ratio=1)+point2d([(data['t'],0)],size=48,color=data['ccolor'],markeredgecolor='blue')
            }
