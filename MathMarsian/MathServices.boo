namespace MathMarsian

import System

partial static class MathServices:
	
	private numberSymbols = (
		char('0'), 
		char('1'),
		char('2'),
		char('3'),
		char('4'),
		char('5'),
		char('6'),
		char('7'),
		char('8'),
		char('9')
	)
	
	private operatorSymbols = (
		"+",
		"-",
		"*",
		"×",
		"/",
		"÷",
		"%",
		"^",
		"=",
		">",
		"<",
		"!",
		"&",
		"|",
		"(",
		")"
	)
	
	private operatorDualSymbols = (
		"<<",
		">>",
		"<>",
		"!=",
		">=",
		"<="
	)
	
	def IsNumber(character as char):
		
		for symbol in numberSymbols:
			if symbol == character:
				return true
				
		return false
		
	private def GetIndexOfDual(operator as string):
		
		for index in range(operatorDualSymbols.Length):
		
			if operatorDualSymbols[index] == operator:
				
				if operatorDualSymbols[index] == "!=": # alias for <>
					return 2
					
				return index
				
		return -1
		
	private def GetIndexOf(operator as string):
		
		for index in range(operatorSymbols.Length):
			
			if operatorSymbols[index] == operator:
				
				if operatorSymbols[index] == "×": # alias for *
					return 2
					
				if operatorSymbols[index] == "÷": # alias for /
					return 4
					
				return index
				
		return -1
	
	def FindNumber(ref query as string):
		
		characters = List[of char]()
		commaUsed = false
		count as byte = 0
		
		for character in query:
			
			if IsNumber(character):
				characters.Add(character)
				
			elif character == char('.'):
				
				if not commaUsed:
					
					commaUsed = true
					characters.Add(character)
					
				else:
					break
				
			elif character == char('-'):
				
				if characters.Count == 0:
					characters.Add(character)
					
				else:
					break
					
			else:
				break
			
			++count
			
		query = query[count:]
		return double.Parse(string(characters.ToArray()))
		
	def FindOperator(ref query as string) as Operators:
		
		operatorPairResult = GetIndexOfDual(query[:2])
		
		if operatorPairResult != -1:
			
			query = query[2:]
			
			return operatorPairResult + 100 cast Operators
			
		operatorSingleResult = GetIndexOf(query[:1])
		
		if operatorSingleResult != -1:
			
			query = query[1:]
			
			return operatorSingleResult cast Operators
			
		return Operators.Invalid