class Generator(BaseGenerator):
    def data(self):
        [a,b] = [1,1]

        while(abs(a) == abs(b) or (a>0 and b>0)):
            a = randrange(1,20)*choice([-1,1])
            b = randrange(10,30)*choice([-1,1])
            clist = [a+b, a-b, b-a, -a-b]
        
        shuffle(clist)
        ch = [{"letter": "a", "value": clist[0]},{"letter": "b", "value": clist[1]},{"letter": "c", "value": clist[2]},{"letter": "d", "value": clist[3]}]

        if(b>0):
            bt = str(b)
            brt = "(-"+str(b)+")"
        else:
            bt = "("+str(b)+")"
            brt = str(-1*b)
            
        if(choice([True,False])):
            [op,nop] = ["+","-"]
            answer = a+b
            dist = a-b
            oping = 'adding'
            sa = ''
            
        else:
            [op,nop] = ["-","+"]
            answer = a-b
            dist = a+b
            oping = 'subtracting'
            sa = 'first rewrite all subtraction as addition of the opposite: here, change -'+bt+' into +'+brt+'. Then,'
            
        if(op == "+"):
            if(a*b>0):
                scomp = "the same"
            else:
                scomp = "opposite"
        else:
            if(a*b>0):
                scomp = "opposite"
            else:
                scomp = "the same"
            
        if(scomp == "the same"):
            sdir = "add"
            sop = "+"
            ssign = "When adding, the sign of our answer matches the (shared) sign of the numbers we added."
        else:
            sdir = "subtract"
            sop = "-"
            ssign = "When subtracting, the sign of our answer matches the sign of the number with greater absolute value."
        
        return {
            "a": a,
            "op": op,
            "b": bt,
            "c": answer,
            "choices": ch,
            "distractor": dist,
            "nop": nop,
            "oping": oping,
            "subadvice": sa,
            "brt": bt if op=="+" else brt,
            "scomp": scomp,
            "sdir": sdir,
            "ssign": ssign,
            "aa": max(abs(a),abs(b)),
            "ab": min(abs(a),abs(b)),
            "ac": abs(answer),
            "sop" : sop,
            "sans" : "positive" if answer > 0 else "negative"
        }
