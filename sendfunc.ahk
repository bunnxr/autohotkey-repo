KeyArray := [{sc: 0x23, event: "Down"}, {sc: 0x23, event: "Up"}, {sc: 0x17, event: "Down"}, {sc: 0x17, event: "Up"}]

InputKeyboardEvents(KeyArray)

InputKeyboardEvents(KeyArray)
{
   static INPUT_KEYBOARD := 1, KEYEVENTF_KEYUP := 2, KEYEVENTF_SCANCODE := 8, InputSize := 16 + A_PtrSize*3
   VarSetCapacity(INPUTS, InputSize * KeyArray.MaxIndex(), 0)
   addr := &INPUTS
   for k, v in KeyArray
      addr := NumPut( (v.event = "Up" ? KEYEVENTF_KEYUP : 0) | KEYEVENTF_SCANCODE | (v.sc >> 8)
            , NumPut(v.sc & 0xFF
            , NumPut(INPUT_KEYBOARD, addr + 0) + 2, "UShort"), "UInt" ) + 8 + A_PtrSize*2

   DllCall("SendInput", "UInt", KeyArray.MaxIndex(), "Ptr", &INPUTS, "Int", InputSize)
}