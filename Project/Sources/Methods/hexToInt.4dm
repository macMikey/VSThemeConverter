//%attributes = {}
C_LONGINT:C283($0)  //nibble
C_TEXT:C284($1)  //hex char

C_LONGINT:C283($ve_nibble)  //nibble
C_TEXT:C284($va_hex)  //hex char

If (Count parameters:C259>0)
	$va_hex:=$1
	
	If (Length:C16($va_hex)>0)
		
		C_LONGINT:C283($vl_hexAscii)
		$vl_hexAscii:=Character code:C91($va_hex[[1]])
		
		Case of 
			: (($vl_hexAscii>=0x0030) & ($vl_hexAscii<=0x0039))  //0=> 9
				$ve_nibble:=$vl_hexAscii-0x0030  //0=> 9
				
			: (($vl_hexAscii>=0x0041) & ($vl_hexAscii<=0x0046))  //A=> F
				$ve_nibble:=$vl_hexAscii-0x0037  //10=> 15
				
			: (($vl_hexAscii>=0x0061) & ($vl_hexAscii<=0x0066))  //a=> f
				$ve_nibble:=$vl_hexAscii-0x0057  //10=> 15
				
			Else 
				$ve_nibble:=0
		End case 
		
	Else 
		$ve_nibble:=0
	End if 
	
End if 
$0:=$ve_nibble