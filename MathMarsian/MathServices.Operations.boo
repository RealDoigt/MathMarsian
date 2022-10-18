namespace MathMarsian

import System

class NotAnOperationException(Exception):
	pass

partial static class MathServices:
	
	def GetNotOperation(num as callable() as double):
		
		def n():
			
			if num() != 0.0:
				return 0.0
				
			return 1.0
			
		return n
	
	def GetOperation(leftNum as callable() as double, op as Operators, rightNum as callable() as double):
		
		if op == Operators.Plus: 
			
			def add():
				return leftNum() + rightNum()
				
			return add
			
		if op == Operators.Minus:
			
			def minus():
				return leftNum() - rightNum()
				
			return minus
		
		if op == Operators.Multiply:
			
			def multiply():
				return leftNum() * rightNum()
				
			return multiply
		
		if op == Operators.Divide:
			
			def divide():
				return leftNum() / rightNum()
				
			return divide
			
		if op == Operators.Modulo:
			
			def modulo():
				return (leftNum() cast int % rightNum() cast int) cast double
			
			return modulo
			
		if op == Operators.LeftBitshift:
			
			def lshift:
				return (leftNum() cast int << rightNum() cast int) cast double
				
			return lshift
			
		if op == Operators.RightBitshift:
			
			def rshift:
				return (leftNum() cast int >> rightNum() cast int) cast double
				
			return rshift
				
		if op == Operators.Power:
			
			def power:
				return Math.Pow(leftNum(), rightNum())
				
			return power
			
		if op == Operators.Equal:
			
			def isEqual():
				
				if leftNum() == rightNum():
					return 1.0
					
				return 0.0
				
			return isEqual
			
		if op == Operators.NotEqual:
			
			def isNotEqual():
				
				if leftNum() != rightNum():
					return 1.0
					
				return 0.0
				
			return isNotEqual
			
		if op == Operators.Greater:
			
			def isGreater():
				
				if leftNum() > rightNum():
					return 1.0
					
				return 0.0
				
			return isGreater
			
		if op == Operators.Lower:
			
			def isLower():
				
				if leftNum() < rightNum():
					return 1.0
					
				return 0.0
				
			return isLower
			
		if op == Operators.GreaterOrEqual:
			
			def isGreaterOrEqual():
				
				if leftNum() >= rightNum():
					return 1.0
					
				return 0.0
				
			return isGreaterOrEqual
			
		if op == Operators.LowerOrEqual:
			
			def isLowerOrEqual():
				
				if leftNum() <= rightNum():
					return 1.0
					
				return 0.0
				
			return isLowerOrEqual
			
			
		if op == Operators.And:
			
			def n():
				return leftNum() and rightNum()
				
			return n
			
		if op == Operators.Or:
			
			def o():
				return leftNum() or rightNum()
				
			return o
			
		raise NotAnOperationException()

