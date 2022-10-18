namespace MathMarsian

import System

partial static class MathServices:
	
	# for collections, useless otherwise
	private struct ParenthesisPair:
		
		parentIndex as int
		indexLeft as int
		indexRight as int
	
	private def GetParenthesisOrder(stack as List[of object]):
		
		parentheses = ParenthesisPair()
		
		for index in range(stack.Count):
			
			if stack[index] isa Operators:
				if stack[index] cast Operators == Operators.LeftParenthesis:
					pass
	
	def BuildStack(query as string):
		
		query = query.Replace(" ", "")
		stack = List[of object]()
		
		startWithOperator = not IsNumber(query[0]) and query[0] != char('-')
		
		while not string.IsNullOrEmpty(query):
		
			if startWithOperator:
				
				startWithOperator = false
				stack.Add(FindOperator(query))
				continue
				
			stack.Add(FindNumber(query))
			operator = FindOperator(query)
			
			if operator == Operators.Invalid:
				continue
				
			stack.Add(operator)