namespace MathMarsian

import System

######## TEST 1 ########
#queryString = "123 * 123"
#queryString = queryString.Replace(" ", "")

#print MathServices.FindNumber(queryString) - .1
#print queryString
#print MathServices.FindOperator(queryString)
#print queryString

######## TEST 2 ########
#q = "7.8 * -100 / 12"
q = "202 * 666 - 12" 
q = q.Replace(" ", "")

n1 = MathServices.FindNumber(q)
o1 = MathServices.FindOperator(q)
n2 = MathServices.FindNumber(q)
o2 = MathServices.FindOperator(q)
n3 = MathServices.FindNumber(q)

opn = MathServices.GetOperation(
	MathServices.GetOperation({return n1}, o1, {return n2}), o2, {return n3}
)

print opn()

print "Press any key to continue . . . "
Console.ReadKey(true)
