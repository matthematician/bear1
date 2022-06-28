class Generator(BaseGenerator):
    def data(self):
        vr = ['a', 'b', 'c', 'k', 'm', 'n', 'p', 'q', 't', 'v', 'x', 'y']
        shuffle(vr)
        [x,y] = vr[0:2]
        
        [A,n,m,p,q] = [3,1,-5,1,4]
        clist = [1,1,1,1,1,1]
        while( len(set([A,n,m,p,q]))<5 or len(set(clist))<6 ):
            A = randint(2,6)
            n = randint(1,6)*choice([-1,1])
            m = randint(1,6)*choice([-1,1])
            p = randint(1,6)
            q = randint(1,6)
            clist = [
                (A*var(x)^n*var(y)^m)^(-2)*(var(x)^p*var(y)^q),
                A*(var(x)^n*var(y)^m)^(-2)*(var(x)^p*var(y)^q),
                A*var(x)^(n-2)*var(y)^(m-2)*(var(x)^p*var(y)^q),
                -2*A*(var(x)^n*var(y)^m)^(-2)*(var(x)^p*var(y)^q),
                -A^2*(var(x)^n*var(y)^m)^(-2)*(var(x)^p*var(y)^q),
                var(x)^abs(p-2*n)*var(y)^abs(q-2*m)/A/A
                ]
        
        if(n==1):
            nt = ""
        else:
            nt = n
        if(m==1):
            mt = ""
        else:
            mt = m    
            
        ch = [
            {'letter': 'a', 'value': clist[0]},
            {'letter': 'b', 'value': clist[1]},
            {'letter': 'c', 'value': clist[2]},
            {'letter': 'd', 'value': clist[3]},
            {'letter': 'e', 'value': clist[4]},
            {'letter': 'f', 'value': clist[5]},
        ]
        
        return {
            "A": A,
            "x": x,
            "y": y,
            "n": nt,
            "m": mt,
            "choices": ch,
            "mon2": var(x)^p*var(y)^q,
            "answer": ((A*var(x)^n*var(y)^m)^(-2)*(var(x)^p*var(y)^q)).full_simplify()
            
        }
