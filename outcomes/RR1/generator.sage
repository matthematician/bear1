class Generator(BaseGenerator):
    def data(self):
        vr = ['a', 'b', 'c', 'k', 'm', 'n', 'p', 'q', 't', 'v', 'x', 'y']
        shuffle(vr)
        x = var(vr[0])
      
        sgn = choice([1,-1])
        if(sgn == 1):
            [prompt,op] = ["Add","+"]
            
        else:
            [prompt,op] = ["Subtract", "-"]
            
        [a,b]=[randint(1,6)*choice([-1,1]),randint(1,6)*choice([-1,1])] # Denominators (x+a) and (x+a)(x+b)
        [c,d] = [x,x]
        clist = [
            1,1,1,1,1,1
        ]
        while(c == x and d == x):
            c = choice([x,randint(1,6)*choice([-1,1])])
            d = choice([x,randint(1,6)*choice([-1,1])])
            clist = [
                (c/(x+a) + sgn*d/(x+a)/(x+b)).full_simplify(),
                ((c+sgn*d)/(x+a+x^2+(a+b)*x+a*b)).full_simplify(),
                ((c+sgn*d)/(x+a)/(x+b)).full_simplify(),
                ((c+(x+a)*(x+b))/(sgn*d+x+a)).full_simplify(),
                ((c*(x+a)*(x+b))/(sgn*d*(x+a))).full_simplify(),
                (sgn*d/c/(x+b)).full_simplify()
            ]


            
        
    
        
        answern= clist[0].numerator()
        answerd= clist[1].denominator()

        shuffle(clist)

        ch = [
            {'letter': 'a', 'valuen': clist[0].numerator(), 'valued': clist[0].denominator()},
            {'letter': 'b', 'valuen': clist[1].numerator(), 'valued': clist[1].denominator()},
            {'letter': 'c', 'valuen': clist[2].numerator(), 'valued': clist[2].denominator()},
            {'letter': 'd', 'valuen': clist[3].numerator(), 'valued': clist[3].denominator()},
            {'letter': 'e', 'valuen': clist[4].numerator(), 'valued': clist[4].denominator()},
            {'letter': 'f', 'valuen': clist[5].numerator(), 'valued': clist[5].denominator()},
        ]
        

        return {
            "n1": c,
            "d1": x+a,
            "n2": d,
            "d2": expand( (x+a)*(x+b) ),
            "op": op,
            "prompt": prompt,
            "choices": ch,
            "answern": answern,
            "answerd": answerd
           
        }
